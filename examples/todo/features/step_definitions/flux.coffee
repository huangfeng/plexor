t = require '../support/tokens'
{ findStore, once } = require '../support/flux'

module.exports = ->

  @Given t.x("(#{t.var}) (#{t.arg})"), (name, value) ->
    name = name[1..]
    value = value[1...-1]
    @[name] = value

  @When t.x("([^@]*) (#{t.arg})"), (action, arg, done) ->
    { store, actions } = findStore @store
    once store, @on, -> done()
    arg = arg[1...-1]
    actions[action] arg

  @Then t.x(t.should), (matcher)->
    { store } = findStore @store
    eval "store.getAll().should.#{matcher.split(' ').join '.'}()"

  @Then t.x("#{t.should}:"), (matcher, value) ->
