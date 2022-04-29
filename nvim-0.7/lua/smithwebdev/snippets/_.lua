ls = require("luasnip")
isn = ls.indent_snippet_node
return {
  s("ternary", {
    i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
  }),
  ls.parser.parse_snippet('expand', '-- this is what was expanded!'),

  s('snip',
    c(1,{fmt([[
    s({{
      trig = '{}',
      name = '{}',
      dscr = '{}'
    }}, {{
    {}
    }})]], {i(1), i(2), i(3), i(4)})}
    )),
  --s('snip2',
  --  t('fmt\([['),
  --  t({'', '\ts({'}),
  --  t({'  ', '\ttrig = \''}), i(1), t('\''),
  --  t({'  ', '\tname = \''}), i(2), t('\''),
  --  t({'  ', '\tdscr = \''}), i(3), t('\''),
  --  t({'','\}, {}'})
  --  --t(''), i(4),
  --  --t('})]], {'), i(5),
  --  --t('})}')
  --  ),
  s("trigger", {
    t({"After jumping forward once, cursor is here ->"}), i(2),
    t({"","\tAfter expanding, the cursor is here ->"}), i(1),
    t({"", "After jumping once more, the snippet is exited there ->"}), i(0),
  })
},

  print('all snippets attached')

