return {
  s({
    trig = 'wkey',
    name = 'Wezterm Keybind',
    dscr = 'Wezterm Keybind snippet'
  },
    fmt([[
    {{ key = '{}'{}{} }}
    ]], {
        i(1),
        c(2, {
          t(' '),
          {
            t(", mods = '"),
            c(1, {
              t(''),
              t('ALT'),
              t('CTRL'),
              t('LEADER'),
              t('SHIFT'),
              t('SUPER'),
            }),
            t("'")
          }
        }),
        c(3, {
          t(""),
          {
            t(", action = wezterm.action."),
            i(1),
            t(',')
          }
        })
      })
  ),
  s({
    trig = 'wmod',
    name = 'Wezterm Key Mod Combinations',
    dscr = 'Wezterm Key Mod Combinations'
  },
    fmt([[{}]], {
      c(1,{
        t('ALT|CTRL'),
        t('ALT|SHIFT'),
        t('ALT|SUPER'),
        t('ALT|LEADER'),
        t('CTRL|SHIFT'),
        t('CTRL|SUPER'),
        t('CTRL|LEADER'),
        t('SHIFT|SUPER'),
        t('SHIFT|LEADER'),
      })
    })
  ),
  s({
    trig = 'test',
    name = 'test',
    dscr = 'something'
  },
    fmt([[example: {}, function: {}]], { i(1), same(1)})
  ),
  s({
    trig = 'rq',
    name = 'require',
    dscr = 'require statement'
  },
    fmt([[
    {}
    ]], {
        c(1,{
          t('require'),
          t('requires'),
          { t('requires = {'), i(1), t('}') },
          { t("require'"), i(1), t("'.setup()") }
        })
      })
  ),
  s('key', fmt([[
  {}noremap('{}', '{}', {{ desc = '{}'}})
  ]], {
      c(1, {
        t('i'),
        t('n'),
        t('v'),
        t('t')
      }),
      i(2),
      i(3),
      i(4)
    })
  ),
  s('pcreate', fmt([[
     local M = {{}}

     M.plugin = {{
       {}

       config = function()
         {}
       end
     }}

     return M]],
    { i(1), i(2) })),
  s('aug', fmt("vim.api.nvim_create_autogroup('{}', {{ clear = true }})", { i(1) })),
  s('auc', fmt([[
      vim.api.nvim_create_autocmd('{}', {{
        pattern = '{}',
        command = '{}',
        group = '{}'
      }})
    ]], { i(1), i(2), i(3), i(4) })),

  --rails class erb
  s({
    trig = 'cla',
    name = 'class',
    dscr = 'snippet for class option snippet in erb'
  }, fmt([[
    c({}, {{
      t(''),
      {{ t('class: \''), i(1), t('\'') }}
    }})
  ]], { i(1) })
  ),
  s({
    trig = 'dest',
    name = 'destroy',
    dscr = 'snippet for destroy method snippet in erb links'
  },
    fmt([[
      c({}, {{
      {{ t(', destroy_user_session_path, method: :delete'), t(' ') }},
      {{ t(', '), i(1), t('_path('),i(2),t('), method: :delete'), t(' ') }},
      {{ t(', '), i(1), t(', method: :delete'), t(' ') }},
      {{ t(', destroy_user_session_path, data: {{"turbo-method": :delete}}'), t(' ') }},
      {{ t(', '), i(1), t('_path('),i(2),t('), data: {{"turbo-method": :delete}}'), t(' ') }},
      {{ t(', '), i(1), t(', data: {{"turbo-method": :delete}}'), t(' ') }},
      }})
    ]], { i(1) })
  ),
}
