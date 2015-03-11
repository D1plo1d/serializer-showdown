require 'msgpack'

class SerializationShowdown::MsgpackBenchmark

  def initialize
    @data = SerializationShowdown.example_data
    @serialized_data = serialize
  end

  def serialize
    @data.to_msgpack
  end

  def deserialize
    MessagePack.unpack @serialized_data
  end
end