local same = function(index)
  return f(function(arg)
    return arg[1]
  end, { index })
end

return {
  s(
    'req',
    fmt(
      [[local {} = require "{}"]],
      { f(function(import_name)
      local parts = vim.split(import_name[1][1], ".", true)
      return parts[#parts] or ''
    end, { 1 }), i(1) }
    )
  ),
  --s("req", fmt([[local {} = require('{}')]], { i(1), rep(1)})),
  s('key', fmt([[
  {}noremap('{}',  '{}', {{ desc = '{}'}})
  ]], {
    c(1, {
      t('i'),
      t('n'),
      t('v')
    }),
    i(2),
    i(3),
    i(4)
  })
  ),
  s('pcreate', fmt([[
     local M = {{}}

     M.plugin = {{
       {},

       config = function()
         {}
       end
     }}

     return M]],
    { i(1), i(2) })),
  --s('auc', {
  --  t('vim.api.nvim_create_autocmd({ '),
  --  i(1),
  --  t(" '}, {"),
  --  t('\t'),
  --  i()
  --})
  --}),
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
