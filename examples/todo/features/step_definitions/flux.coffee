{ exp, identifier } = require '../support/tokens'
{ findStore } = require '../support/flux'

module.exports = ->

  @Then exp("(#{identifier})s should be empty"), (store) ->
    store = findStore store
    store.getAll().should.be.empty()




