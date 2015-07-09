describe 'Tables', ->

  table = require relative 'support/tables'

  it 'returns array from single columns', ->

    table

      raw: -> [['1'], ['true'], ['that']]

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

  it 'returns multiple objects otherwise', ->

    table

      raw: -> [
        ['x', 'y', 'z']
        ['0', '0', '1']
        ['0', '1', '0']
        ['1', '0', '0']
      ]

    .should.eql [
        { x: 0, y: 0, z: 1 }
        { x: 0, y: 1, z: 0 }
        { x: 1, y: 0, z: 0 }
      ]

  it 'uses headers for muliple objects in 1 or 2 columns', ->

    table

      raw: -> [['[id]'], ['1'], ['2']]

    .should.eql [
      { id: 1 }
      { id: 2 }
    ]