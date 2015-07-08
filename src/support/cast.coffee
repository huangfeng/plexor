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

module.exports =

  cast: (value) ->
    _.find(_.map types, (t) -> t value)()

  cammelCase: (spaced) ->
    tokens = spaced.split ' '
    rest = tokens[1..].map (x) -> "#{x[0].toUpperCase()}#{x[1..]}"
    "#{tokens[0]}#{rest}"

