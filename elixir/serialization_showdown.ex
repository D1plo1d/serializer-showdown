defmodule SerializationShowdown do
  def start(args) do
    module = :"Elixir.#{Enum.at(args, 0)}Benchmark"
    method = String.to_atom Enum.at args, 1
    iterations = String.to_integer Enum.at args, 2
    file = File.read! Path.expand("../test_data.json")
    {:ok, data} = JSON.decode file
    if method == :deserialize do
      {:ok, data} = module.serialize(data)
    end
    {time, {:ok}} = :timer.tc(
      &perform/4,
      [module, method, data, iterations]
    )
    IO.puts time / 1000 / 1000 # Seconds
  end

  def perform(_module, _method, _data, 0) do
    {:ok}
  end

  def perform(module, method, data, n) do
    {:ok, _res} = apply(module, method, [data])
    perform module, method, data, n-1
    {:ok}
  end
end

SerializationShowdown.start System.argv
