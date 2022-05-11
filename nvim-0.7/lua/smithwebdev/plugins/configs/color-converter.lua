local M = {}

M.plugin = {
  'NTBBloodbath/color-converter.nvim', -- https://github.com/NTBBloodbath/color-converter.nvim,

  config = function()
    local u = require'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

    nnoremap('<leader>ccc',  '<Plug>ColorConvertCycle<CR>', { desc = 'Cycle colors between Hex, RGB, and HSL'})
    nnoremap('<leader>cch',  '<Plug>ColorConvertHEX<CR>',   { desc = 'Cycle current color to HEX'})
    nnoremap('<leader>ccr',  '<Plug>ColorConvertRGB<CR>',   { desc = 'Cycle current color to RGB'})
    nnoremap('<leader>ccH',  '<Plug>ColorConvertHSL<CR>',   { desc = 'Cycle current color to HSL'})
  end
}

return M
