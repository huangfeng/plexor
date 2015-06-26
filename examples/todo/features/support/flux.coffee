require './globals'

module.exports =

  findStore: (name) -> require relative "stores/#{name}Store"

  once: (store, event, done) ->
    cb = ->
      store.removeListener event, cb
      done()

    store.on event, cb