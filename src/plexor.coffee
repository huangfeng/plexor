require './support/globals'
{ any } = require './support/matchers'

cast = require './support/cast'
t = require './support/tokens'
{ findStore, once } = require './support/flux'

module.exports = ->

  should = (matcher, arg) ->
    "store.getAll().should.#{matcher.split(' ').join '.'}(#{arg})"

  objectTable = (table) ->
    _.zipObject _.map table.raw(), (x) -> [x[0], cast x[1]]

  @Given t.x("(#{t.var}) (#{t.arg})"), (name, value) ->
    name = name[1..]
    value = value[1...-1]
    @[name] = value

  @Given t.x("(#{t.var}) (?:.+):"), (name, value) ->
    { store } = findStore @store
    name = name[1..]
    value = objectTable value
    @[name] = any store.getAll(), value

  @When t.x("([^@]*) (#{t.arg})"), (action, arg, done) ->
    { store, actions } = findStore @store
    once store, @on, -> done()
    arg = arg[1...-1]
    actions[action] arg

  @Then t.x(t.should), (matcher)->
    { store } = findStore @store
    eval should matcher

  @Then t.x("#{t.should}:"), (matcher, value) ->
    { store } = findStore @store
    value = objectTable value
    eval should matcher, 'value'
