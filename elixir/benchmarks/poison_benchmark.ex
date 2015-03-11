defmodule PoisonBenchmark do
  def deserialize(data) do
    {:ok, Poison.Parser.parse! data}
  end

  def serialize(data) do
    {:ok, Poison.encode! data}
  end

end
