require './globals'

resolve = (file) -> try require relative file catch

module.exports =

  findStore: (name) ->
    store: resolve "stores/#{name}Store"
    actions: resolve "actions/#{name}Actions"

  once: (store, event, done) ->
    cb = ->
      store.removeListener event, cb
      done()

    store.on event, cb