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
Elixir               Poison                8.91938
Elixir               Msgpax                5.35549
Elixir               Exjsx                11.88917
Ruby                 Json                  5.23875
Ruby                 Msgpack               2.36682

Language             Serializer           Real Time
--------------------------------------------------------------------------------
Elixir               Poison               47.03580
Elixir               Msgpax               25.02741
Elixir               Exjsx                33.39393
Ruby                 Json                  3.90487
Ruby                 Msgpack               0.56568
```
