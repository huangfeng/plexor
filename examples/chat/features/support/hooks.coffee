require './plexor'
{ LocalStorage } = require 'node-localstorage'

require relative 'stores/MessageStore'
require relative 'stores/ThreadStore'
require relative 'stores/UnreadThreadStore'

module.exports = ->

  @Before ->
    return if seeded?
    global.localStorage = new LocalStorage './scratch'
    (require relative 'ChatExampleData').init()
    (require relative 'utils/ChatWebAPIUtils').getAllMessages()
    global.seeded = true
