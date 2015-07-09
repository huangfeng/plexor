describe 'Casting', ->

  { cast, cammelCase } = require relative 'support/cast'

  it 'defaults to same value', ->
    cast('shadow').should.eql 'shadow'

  it 'detects numbers', ->
    cast('42').should.eql 42

  it 'detects bools', ->
    cast('true').should.be.true()
    cast('yes').should.be.true()
    cast('false').should.be.false()
    cast('no').should.be.false()

  it 'cammel cases', ->
    cammelCase('thematrix').should.eql 'thematrix'
    cammelCase('the matrix').should.eql 'theMatrix'
