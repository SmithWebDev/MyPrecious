local M = {}

vim.g.splitjoin_split_mapping = ''
vim.g.splitjoin_join_mapping = ''

M.plugin = {
  'AndrewRadev/splitjoin.vim', -- https://github.com/AndrewRadev/splitjoin.vim

  config = function()

    local u = require 'smithwebdev.core.utils'
    local nnoremap = u.nnoremap
    local vnoremap = u.vnoremap

    nnoremap('<leader>sj',  ':SplitjoinSplit<CR>', { desc = 'Splitjoin Split'})
    vnoremap('<leader>sj',  ':SplitjoinSplit<CR>', { desc = 'Splitjoin Split'})
    nnoremap('<leader>sk',  ':SplitjoinJoin<CR>',  { desc = 'Splitjoin Join'})
    vnoremap('<leader>sk',  ':SplitjoinJoin<CR>',  { desc = 'Splitjoin Join'})
  end
}

return M
