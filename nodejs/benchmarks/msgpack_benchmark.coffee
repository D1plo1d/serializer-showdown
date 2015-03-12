msgpack = require('msgpack')

module.exports =
  deserialize: (data) ->
    msgpack.unpack data

  serialize: (data) ->
    msgpack.pack data
