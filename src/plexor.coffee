_ = require 'lodash'

require './support/globals'
{ any } = require './support/matchers'
table = require './support/tables'
{ cast, cammelCase } = require './support/cast'
t = require './support/tokens'
{ findStore, once } = require './support/flux'

steps = ->

  should = ({actual, matcher, expected}) ->
    actual ?= 'store.getAll()'
    expected ?= ''
    "#{actual}.should.#{matcher.split(' ').join '.'}(#{expected})"

  @Given t.x("(#{t.var}) (#{t.arg})"), (name, value) ->
    name = name[1..]
    value = value[1...-1]
    @[name] = value

  @Given t.x("(#{t.var}) (?:.+):"), (name, value) ->
    { store } = findStore @store
    name = name[1..]
    value = table value
    found = any store.getAll(), value
    @[name] = found?[name]? and
      found[name] or found

  onAction = (world, action, args) ->

    argValue = (arg) ->
      if arg[0] is '@'
      then world[arg[1..]]
      else arg[1...-1]

    action = action + args if args.length is 1
    action = cammelCase action

    args = t.args args
    args = _.map args, argValue

    [action, args]

  @When t.x("(#{t.text})(.+)"), (action, args, done)  ->
    [action, args] = onAction @, action, args
    { store, actions } = findStore @store
    once store, 'change', -> done()
    actions[action].apply @, args

  @Then t.x(t.should), (matcher)->
    { store } = findStore @store
    eval should { matcher }

  @Then t.x("#{t.should}:"), (matcher, value) ->
    { store } = findStore @store
    value = table value
    eval should { matcher, expected: 'value' }

module.exports = (config={}) ->
  _.merge global.config, config
  steps
