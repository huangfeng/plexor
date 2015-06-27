require './globals'

module.exports =

  findStore: (name) ->
    store: require relative "stores/#{name}Store"
    actions: require relative "actions/#{name}Actions"


  once: (store, event, done) ->
    cb = ->
      store.removeListener event, cb
      done()

    store.on event, cb