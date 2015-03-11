defmodule JiffyBenchmark do
  def deserialize(data) do
    {:ok, :jiffy.decode data}
  end

  def serialize(data) do
    {:ok, :jiffy.encode data}
  end

end
