local same = function(index)
  return f(function(arg)
    return arg[1]
  end, {index})
end

return {
  s(
    'req',
    fmt(
      [[local {} = require "{}"]],
      { f(function(import_name)
        local parts = vim.split(import_name[1][1], ".", true)
        return parts[#parts] or ''
      end, {1}), i(1)}
    )
  ),
  --s("req", fmt([[local {} = require('{}')]], { i(1), rep(1)})),
  s('keymap', fmt("{}noremap('{}',  '{}', {{ desc = '{}'}})", {c(1, {t('i'), t('n'), t('v')}), i(2), i(3), i(4)})),
  s('pcreate', fmt([[
     local M = {{}}

     M.plugin = {{
       '{}',

       config = function()
         {}
       end
     }}

     return M]],
    {i(1), i(2)})),
  --s('auc', {
  --  t('vim.api.nvim_create_autocmd({ '),
  --  i(1),
  --  t(" '}, {"),
  --  t('\t'),
  --  i()
  --})
  --}),
  s('aug', fmt("vim.api.nvim_create_autogroup('{}', {{ clear = true }})", {i(1)})),
  s('auc', fmt([[
      vim.api.nvim_create_autocmd('{}', {{
        pattern = '{}',
        command = '{}',
        group = '{}'
      }})
    ]], {i(1), i(2), i(3), i(4)})),
}
