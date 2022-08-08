local M = {}

M.plugin = {
  'ludovicchabant/vim-gutentags', -- https://github.com/ludovicchabant/vim-gutentags

  config = function()
    local u = require 'smithwebdev.core.utils'
    local nnoremap = u.nnoremap
    nnoremap('<leader>gt',  ':GutentagsToggleEnabled', { desc = 'Toggles updating on buffer save'})
    nnoremap('<leader>gu',  ':GutentagsUpdate!', { desc = 'Updates the current tags file (project)'})
    nnoremap('<leader>gU',  ':GutentagsUpdate', { desc = 'Updates the current tags file (current file)'})

  end
}

return M
