return {
  s('snip',
    c(1,{fmt([[
  -- {}
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
        rep(1),
        c(4,{
          {t('{'),t(""),
            t('\t'),i(1),t(''),
            t('}')},
          {t('fmt([['), i(1), t(']], {'), i(2), t('})')}
        }),
      }),
    }
    )
  ),
  s('pcreate',
    fmt(
      [[
local M = {{}}

M.plugin = {{
  {}

  config = function()
    {}
  end
}}

return M]],
      {
        i(1),
        i(2)
      }
    )),

  -- Neovim set keymap API
  s({
    trig = 'key',
    name = 'Keymap',
    dscr = 'Neovim set keymap API'
  },
    fmt([[vim.keymap.set('{}', '{}', '{}', {{ desc = '{}'}})]], {
      i(1),
      i(2),
      i(3),
      i(4),
    })
  ),
},

print('lua snippets attached')
