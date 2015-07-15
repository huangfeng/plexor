t =
  x: (expr) -> RegExp "^#{expr}$"
  lit: '"[^"]*"'
  id: '\\w+'
  should: 'should ([^:]+)'
  text: '[^@"]+?'

t.var = "@#{t.id}"
t.arg = "#{t.lit}|#{t.var}"
t.args = "(?:(#{t.text}) (#{t.arg}))+"

module.exports = t