local M = {}

M.plugin = {
  'ldelossa/buffertag', -- https://github.com/ldelossa/buffertag

  config = function()
    local u = require 'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

    nnoremap('<leader>/',  ":lua require('buffertag').enable()<CR>", { desc = 'Enable buffertag'})
  end
}

return M
