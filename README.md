A comparison of Ruby, Node and Elixir MsgPack, BSON and JSON serializers.

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
Elixir               Bson                  6.99598
Elixir               Poison                8.12813
Elixir               Msgpax                5.45028
Elixir               Exjsx                11.77435
Elixir               Jiffy                 1.31725
Elixir               MsgpackErlang         1.94611
Ruby                 Json                  4.71681
Ruby                 Bson                  9.04203
Ruby                 Msgpack               2.06065
Nodejs               Json                  1.89100
Nodejs               Bson                  6.28800
Nodejs               Msgpack               3.66900

Language             Serializer           Real Time
--------------------------------------------------------------------------------
Elixir               Bson                 20.00000
Elixir               Poison               45.40536
Elixir               Msgpax               24.59953
Elixir               Exjsx                30.31368
Elixir               Jiffy                 2.74940
Elixir               MsgpackErlang         3.81657
Ruby                 Json                  3.84673
Ruby                 Bson                 11.70578
Ruby                 Msgpack               0.48830
Nodejs               Json                  1.12100
Nodejs               Bson                 15.92100
Nodejs               Msgpack               5.80200
```

## Similar Benchmarks
- https://github.com/eishay/jvm-serializers/wiki
