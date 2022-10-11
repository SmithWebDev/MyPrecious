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
    }},
      {}
    ),]], {
        i(1),
        i(2),
        i(3),
        c(4,{
          {t('{'),t(""),
            t('\t'),i(1),t(''),
            t('}')},
          {t('fmt([['), i(1), t(']], {'), i(2), t('})')}
        })
      }),
    }
    )),
  s({
    trig = 'fmt',
    name = 'format of snippet',
    dscr = 'calls the snippet helper fmt'
  },
    {  }
  ),
  --s({
  --  trig = 'snip2',
  --  name = 'snippet creator',
  --  dscr = 'boilerplate for creating snippets'
  --}, fmt([[
  --s({{
  --  trig = '{}',
  --  name = '{}',
  --  dscr = '{}',
  --}}, fmt([[{}]], {{ {} }})),
  --]], {i(1), i(2), i(3), i(4), i(5)}))
  --),
  s("trigger", {
    t({"After jumping forward once, cursor is here ->"}), i(2),
    t({"","\tAfter expanding, the cursor is here ->"}), i(1),
    t({"", "After jumping once more, the snippet is exited there ->"}), i(0),
  }),
s("trig", {
        i(1, "First jump"),
        t(" :: "),
        sn(2, {
            i(1, "Second jump"),
            t" : ",
            i(2, "Third jump")
        })
    })
},

print('all snippets attached')
