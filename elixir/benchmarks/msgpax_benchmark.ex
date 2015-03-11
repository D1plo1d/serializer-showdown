defmodule MsgpaxBenchmark do
  def deserialize(data) do
    Msgpax.unpack data
  end

  def serialize(data) do
    Msgpax.pack data
  end

end
