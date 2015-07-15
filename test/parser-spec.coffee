describe 'Parser', ->

  t = require relative 'support/tokens'

  describe 'Actions', ->

    matcher = t.x t.args

    verify = (step, { matches }) ->
      step.match(matcher)[1...]
      .should.eql matches


    it 'solves single arg', ->

      verify 'action @arg',
        matches: ['action', '@arg']
