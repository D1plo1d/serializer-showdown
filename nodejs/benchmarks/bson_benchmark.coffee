bson = require "bson"
BSON = bson.BSONPure.BSON

module.exports =
  deserialize: (data) ->
    BSON.deserialize data

  serialize: (data) ->
    BSON.serialize data, false, true, false
