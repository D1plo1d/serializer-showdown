defmodule JsonBenchmark do
  def deserialize(data) do
    JSON.decode data
  end

  def serialize(data) do
    JSON.encode data
  end

end
