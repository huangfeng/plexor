should = require 'should'

should.Assertion.add 'contain', (val) ->
  should.exist _.find(@obj, val) or _.findWhere(@obj, val),
    "could not find #{s val} in #{s @obj}"
