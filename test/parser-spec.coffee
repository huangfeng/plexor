describe 'Parser', ->

  t = require relative 'support/tokens'

  describe 'Args', ->

    it 'empty if unparsable', ->

      t.args '@'
      .should.eql []

    it 'variable', ->

      t.args '@var'
      .should.eql ['@var']

    it 'multiple variables', ->

      t.args '@var1 @var2 & @var3'
      .should.eql ['@var1', '@var2', '@var3']

    it 'literal', ->

      t.args '"lit"'
      .should.eql ['"lit"']

    it 'multiple literals', ->

      t.args '"lit1", "lit2" or mayb "lit3"'
      .should.eql ['"lit1"','"lit2"','"lit3"']

    it 'mixes it literals', ->

      t.args '@arg, "lit" and @arg'
      .should.eql ['@arg','"lit"','@arg']
