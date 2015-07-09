_ = require 'lodash'

{ cast } = require './cast'

hasHeader = (x) -> x[0][0].match /^\[.+\]$/

array = (t) ->
  t = t.raw()
  return if t.length isnt 1 or hasHeader t
  _.map t[0], cast

object = (t) ->
  t = t.raw()
  return if t.length isnt 2 or hasHeader t
  _.zipObject _.map t, (x) -> [x[0], cast x[1]]

list = (t) -> t.hashes()

module.exports = (t) ->
  array(t) or object(t) or list(t)
