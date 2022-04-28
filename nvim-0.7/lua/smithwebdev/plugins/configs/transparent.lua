local M = {}

M.plugin = {
  'xiyaowong/nvim-transparent', -- https://github.com/xiyaowong/nvim-transparent

  config = function()
    local u = require'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

    --nnoremap('<leader><leader>rc',      '<cmd>Console!<CR>',                        { desc = 'Open Rails Console New Tmux Window'})
  end
}

return M
