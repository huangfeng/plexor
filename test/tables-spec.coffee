describe 'Tables', ->

  table = require relative 'support/tables'

  it 'returns array from single columns', ->

    table

      raw: -> [['1', 'true', 'that']]

    .should.eql [1, true, 'that']

  it 'makes an object for 2 columns', ->

    table

      raw: -> [
        ['name', 'lola']
        ['action', 'run']
      ]

    .should.eql

      name: 'lola'
      action: 'run'
