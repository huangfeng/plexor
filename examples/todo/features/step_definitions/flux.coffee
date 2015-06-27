{ exp, identifier, variable, arg } = require '../support/tokens'
{ findStore } = require '../support/flux'

module.exports = ->

  @Given exp("(#{variable}) (.+)"), (name, value) ->
#    define @, name, value

  @When exp("([^@]*) (#{arg})"), (action, arg) ->
#    store = findStore store
#    once store, 'change', -> done()
#    arg = argToValue @, arg
#    doAction action, arg

  @Then exp("should be empty"), ->
#    store = findStore store
#    store.getAll().should.be.empty()

  @Then exp("should include:"), (value) ->