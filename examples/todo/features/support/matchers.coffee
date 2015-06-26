should = require 'should'

global.verify =

  matches: (actual, expected) ->
    for field, value of expected
      should.exist actual[field], "could not find field #{field} in #{actual}"
      actual[field].toString().should.match RegExp value

  contains: (actual, expected) ->
    should.exist match(actual, expected),
      "could not find #{s expected} in #{s actual}"

  doesnt:
    contain: (actual, expected) ->
      should.not.exist match(actual, expected),
        "#{s actual} should not contain #{s expected}"

match = (actual, expected) -> _.findWhere actual, expected
