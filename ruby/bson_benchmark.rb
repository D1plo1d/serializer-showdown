require 'bson'

class SerializationShowdown::BsonBenchmark

  def initialize
    @data = SerializationShowdown.example_data
    @serialized_data = serialize
  end

  def serialize
    @data.to_bson
  end

  def deserialize
    Hash.from_bson StringIO.new @serialized_data
  end
end