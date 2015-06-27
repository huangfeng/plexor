t =
  x: (expr) -> RegExp "^#{expr}$"
  lit: '"[^"]*"'
  id: '\\w+'
  should: 'should ([^:]+)'

t.var = "@#{t.id}"
t.arg = "#{t.lit}|#{t.var}"

module.exports = t