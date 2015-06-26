
{ exp, identifier } = require '../support/tokens'

module.exports = ->

  @Then exp("(#{identifier})s should be empty"), (store) ->
    p store
#    store = findStore store
#    contains @, store.all, items




