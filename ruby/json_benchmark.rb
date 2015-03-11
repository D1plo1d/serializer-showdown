require 'msgpack'

class SerializationShowdown::JsonBenchmark

  def initialize
    @data = SerializationShowdown.example_data
    @serialized_data = serialize
  end

  def serialize
    @data.to_json
  end

  def deserialize
    JSON.parse @serialized_data
  end
end