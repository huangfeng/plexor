t = require '../support/tokens'
{ findStore } = require '../support/flux'

module.exports = ->

  @Given t.x("(#{t.var}) (#{t.arg})"), (name, value) ->
    p arguments
#    define @, name, value

  @When t.x("([^@]*) (#{t.arg})"), (action, arg) ->
    p arguments
#    store = findStore store
#    once store, 'change', -> done()
#    arg = argToValue @, arg
#    doAction action, arg

  @Then t.x(t.should), (matcher)->
    p arguments
#    store = findStore store
#    store.getAll().should.be.empty()

  @Then t.x("#{t.should}:"), (matcher, value) ->
    p arguments
