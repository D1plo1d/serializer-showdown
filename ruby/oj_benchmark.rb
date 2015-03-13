require 'oj'

class SerializationShowdown::OjBenchmark

  def initialize
    @data = SerializationShowdown.example_data
    @serialized_data = serialize
  end

  def serialize
    Oj.dump @data
  end

  def deserialize
    Oj.load @serialized_data
  end
end