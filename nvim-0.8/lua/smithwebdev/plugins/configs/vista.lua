local M = {}

M.plugin = {
  'liuchengxu/vista.vim', -- https://github.com/liuchengxu/vista.vim

  config = function()
    local u = require 'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

    nnoremap('<leader><leader>v', '<cmd>Vista!!<CR>', { desc = 'Open Vista window showing Tags in buffer'})
  end
}

return M
