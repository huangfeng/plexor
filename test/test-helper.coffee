global.p = (x) -> console.log JSON.stringify x
global.m = (x) -> p (name for name of x)

global.relative = (file) -> "#{__dirname}/../src/#{file}"

global.mockery = require 'mockery'
mockery.enable
  warnOnReplace: false,
  warnOnUnregistered: false

global.sinon = require 'sinon'
_ = require 'lodash'
