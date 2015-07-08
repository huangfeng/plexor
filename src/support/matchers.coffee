should = require 'should'

exports.any = any = (items, query) ->
  _.find(items, query) or _.findWhere(items, query)

should.Assertion.add 'contain', (val) ->
  should.exist any(@obj, val),
    "could not find #{s val} in #{s @obj}"
