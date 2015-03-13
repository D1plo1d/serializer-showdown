defmodule BsonBenchmark do
  def deserialize(data) do
    {:ok, Bson.decode data}
  end

  def serialize(data) do
    {:ok, Bson.encode data}
  end

end
