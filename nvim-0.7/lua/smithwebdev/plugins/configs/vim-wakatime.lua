local M = {}

M.plugin = {
  'wakatime/vim-wakatime', -- https://github.com/wakatime/vim-wakatime

  config = function()
  --keybinds
    local u = require'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

    nnoremap('<leader><leader>wt', ':WakaTimeToday<CR>', { desc = 'Echo Total Coding Activity For Today'})
  end
}

return M
