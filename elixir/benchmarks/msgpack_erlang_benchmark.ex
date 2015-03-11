defmodule MsgpackErlangBenchmark do
  def deserialize(data) do
    {:ok, unpacked} = :msgpack.unpack(data)
    formatted = Enum.into unpacked, [], (fn (el) -> Enum.into elem(el, 0), %{} end)
    {:ok, formatted}
  end

  def serialize(data) do
    {:ok, :msgpack.pack data}
  end

end
