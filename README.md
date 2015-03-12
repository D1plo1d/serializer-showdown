A comparison of Ruby and Elixir MsgPack and JSON serializers.

## Setup

1. Install ruby 2.0 or later and Elixir
2. In the top directory run `bundle install`
3. In the elixir folder run `mix deps install`


## Performance Testing

To run the tests run: `bundle exec ruby ./serialization_showdown.rb`

## Results

Running the benchmarks on my 2011 Macbook Air (OSX 10.9.5) yeilds the following:

**Note:** Smaller times are better

```
100 Iterations

Language             Deserializer         Real Time
--------------------------------------------------------------------------------
Elixir               Poison                9.06117
Elixir               Msgpax                5.56455
Elixir               Exjsx                12.45975
Elixir               Jiffy                 1.36592
Elixir               MsgpackErlang         2.19524
Ruby                 Json                  5.13356
Ruby                 Msgpack               2.29646
Nodejs               Json                  0.96800
Nodejs               Msgpack               2.06400

Language             Serializer           Real Time
--------------------------------------------------------------------------------
Elixir               Poison               47.72792
Elixir               Msgpax               24.14008
Elixir               Exjsx                32.74661
Elixir               Jiffy                 2.83808
Elixir               MsgpackErlang         3.89380
Ruby                 Json                  3.88661
Ruby                 Msgpack               0.58689
Nodejs               Json                  1.32100
Nodejs               Msgpack               2.57800
```
