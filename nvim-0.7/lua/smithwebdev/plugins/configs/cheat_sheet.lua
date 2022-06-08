local M = {}

M.plugin = {
  'Djancyp/cheat-sheet', --https://github.com/Djancyp/cheat-sheet

  config = function()
    local u = require 'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

    -- keybindings
    nnoremap('<leader>cs', ':CheatSH<CR>', { desc = 'Cheat Sheet toggle command' })
  end
}

return M
