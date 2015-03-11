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
Elixir               Poison                8.95656
Elixir               Msgpax                5.20889
Elixir               Exjsx                12.15247
Elixir               Jiffy                 1.36307
Elixir               MsgpackErlang         2.21838
Ruby                 Json                  5.02312
Ruby                 Msgpack               2.31670

Language             Serializer           Real Time
--------------------------------------------------------------------------------
Elixir               Poison               48.06485
Elixir               Msgpax               25.11667
Elixir               Exjsx                32.98249
Elixir               Jiffy                 2.86510
Elixir               MsgpackErlang         3.94965
Ruby                 Json                  3.75198
Ruby                 Msgpack               0.63429
```
