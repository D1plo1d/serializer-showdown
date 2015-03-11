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
Elixir               Poison                9.21832
Elixir               Msgpax                5.39049
Elixir               Exjsx                12.27880
Elixir               Jiffy                 1.45259
Ruby                 Json                  5.44228
Ruby                 Msgpack               2.49035

Language             Serializer           Real Time
--------------------------------------------------------------------------------
Elixir               Poison               49.65933
Elixir               Msgpax               27.20542
Elixir               Exjsx                33.68249
Elixir               Jiffy                 3.07260
Ruby                 Json                  4.00482
Ruby                 Msgpack               0.57596
```
