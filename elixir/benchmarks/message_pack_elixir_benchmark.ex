defmodule MessagePackElixirBenchmark do
  def deserialize(data) do
    MessagePack.unpack data
  end

  def serialize(data) do
    MessagePack.pack data
  end

end
