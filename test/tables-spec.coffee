describe 'Tables', ->

  table = require relative 'support/tables'

  it 'returns array from single columns', ->

    table
      raw: -> [['1', 'true', 'that']]
    .should.eql [1, true, 'that']