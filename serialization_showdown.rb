require "json"
require 'benchmark'
require 'open3'

module SerializationShowdown

  def self.iterations
    100
  end

  def self.serializers
    [
      # Elixir Serializers
      # ---------------------
      # [:elixir, :MessagePackElixir], # <= broken - unable to encode
      # [:elixir, :Json], #              <= This is *very* slow!
      [:elixir, :Poison],
      [:elixir, :Msgpax],
      [:elixir, :Exjsx],
      [:elixir, :Jiffy],
      [:elixir, :MsgpackErlang],

      # Ruby Serializers
      # ---------------------
      [:ruby,   :Json],
      [:ruby,   :Msgpack],

      # Node Serializers
      # ---------------------
      [:nodejs, :Json],
      [:nodejs, :Msgpack]
    ]
  end

  def self.example_data
    @json unless @json.nil?
    file = File.read('./test_data.json')
    @json = JSON.parse file
  end

  def self.print_column(a, b, c)
    puts "#{a.to_s.ljust(20)} #{b.to_s.ljust(20)} #{c}"
  end

  def self.run_all
    # initializing the example data
    SerializationShowdown.example_data

    # Running the serializer benchmarks
    puts "\n#{iterations} Iterations\n"
    [:deserialize, :serialize].each do |method|
      puts ""
      print_column "Language", "#{method}r".capitalize, "Real Time"
      puts "-"*80
      serializers.each do |(language,serializer)|
        run language, serializer, method
      end
    end
  end

  def self.run(language, serializer, method)
    time = send :"run_#{language}_serializer", serializer, method
    print_column language.capitalize, serializer, ("%.5f" % time).rjust(8)
  end

  def self.run_ruby_serializer(serializer, method)
    klass = SerializationShowdown.class_eval("#{serializer}Benchmark")
    instance = klass.new
    time = Benchmark.realtime do
      iterations.times{instance.send(method)}
    end
  end

  def self.run_elixir_serializer(serializer, method)
    cmd = "MIX_ENV=prod elixir -pa _build/prod/consolidated "+
          "-S mix run serialization_showdown.ex"
    run_cli_serializer "Elixir", serializer, method, cmd
  end

  def self.run_nodejs_serializer(serializer, method)
    cmd = "coffee ./serialization_showdown.coffee"
    run_cli_serializer "Nodejs", serializer, method, cmd
  end

  def self.run_cli_serializer(language, serializer, method, cmd)
    cmd = "cd ./#{language}; #{cmd} #{serializer} #{method} #{iterations}"
    stdout,stderr,status = Open3.capture3 cmd
    time = stdout.to_f
    return time if status.exitstatus == 0 and time != 0
    puts stderr
    raise "#{language.capitalize} #{serializer} #{method}r failed"
  end

end

require "./ruby/json_benchmark"
require "./ruby/msgpack_benchmark"

SerializationShowdown.run_all
