_ = require 'lodash'

types =

  number: (x) ->
    unless isNaN x
      -> Number x

  bool: (x) ->
    bools = /^true|yes|false|no$/i
    positive = /^true|yes$/i
    if x.match(bools)?
      -> x.match(positive)?

  default: (x) -> -> x

module.exports = (value) ->

  _.find(_.map types, (t) -> t value)()
