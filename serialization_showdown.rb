require "json"
require 'benchmark'
require 'open3'

module SerializationShowdown

  def self.iterations
    ARGV[1] || 100
  end

  def self.filepath
    ARGV[0]
  end

  def self.serializers
    [
      # Elixir Serializers
      # ---------------------
      # [:elixir, :Json], #              <= This is *very* slow!
      [:elixir, :Bson],
      [:elixir, :Poison],
      [:elixir, :Msgpax],
      [:elixir, :Exjsx],
      [:elixir, :Jiffy],
      [:elixir, :MsgpackErlang],

      # Ruby Serializers
      # ---------------------
      [:ruby,   :Json],
      [:ruby,   :Bson],
      [:ruby,   :Msgpack],

      # Node Serializers
      # ---------------------
      [:nodejs, :Json],
      [:nodejs, :Bson],
      [:nodejs, :Msgpack]
    ]
  end

  def self.example_data
    @json unless @json.nil?
    file = File.read(filepath || './test_data.json')
    @json = JSON.parse file
  end

  def self.print_column(a, b, c)
    puts "#{a.to_s.ljust(20)} #{b.to_s.ljust(20)} #{c}"
  end

  def self.run_all
    # initializing the example data
    SerializationShowdown.example_data

    # Running the serializer benchmarks
    puts "\nJSON: #{filepath}" if filepath
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
    require "./ruby/#{serializer.downcase}_benchmark"
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
    time = stdout.strip.to_f
    return time if status.exitstatus == 0 and time != 0
    puts stdout
    puts stderr
    raise "#{language.capitalize} #{serializer} #{method}r failed"
  end

end

SerializationShowdown.run_all
