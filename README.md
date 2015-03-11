A comparison of Ruby and Elixir MsgPack and JSON serializers.

## Setup

1. Install ruby 2.0 or later and Elixir
2. In the top directory run `bundle install`
3. In the elixir folder run `mix deps install`


## Performance Testing

To run the tests run: `bundle exec ruby ./serialization_showdown.rb`

## Results

Running the benchmarks on my 2011 Macbook Air (OSX 10.9.5) yeilds the following:

```
100 Iterations

Language             Deserializer         Real Time
--------------------------------------------------------------------------------
Elixir               Msgpax               5.391
Elixir               Exjsx                12.378
Ruby                 Json                 4.923
Ruby                 Msgpack              2.332

Language             Serializer           Real Time
--------------------------------------------------------------------------------
Elixir               Msgpax               25.616
Elixir               Exjsx                33.626
Ruby                 Json                 4.143
Ruby                 Msgpack              0.6
```
