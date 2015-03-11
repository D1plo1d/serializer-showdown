defmodule ExjsxBenchmark do
  def deserialize(data) do
    JSX.decode data
  end

  def serialize(data) do
    JSX.encode data
  end

end
