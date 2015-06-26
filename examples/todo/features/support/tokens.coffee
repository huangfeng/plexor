t =
  exp: (expr) -> RegExp "^#{expr}$"
  literal: '"[^"]*"'
  identifier: '\\w+'

t.variable = "@#{t.identifier}"
t.arg = "#{t.literal}|#{t.variable}"

module.exports = t