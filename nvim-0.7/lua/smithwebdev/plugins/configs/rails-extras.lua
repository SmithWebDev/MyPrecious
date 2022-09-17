local M = {}

vim.g.blockle_mapping = '<leader>bl'
vim.g.rufo_auto_formatting = 1

M.plugin = {
    'christoomey/vim-rfactory',  --, https://github.com/christoomey/vim-rfactory
    'tpope/vim-endwise',         --, https://github.com/tpope/vim-endwise
    'tpope/vim-dispatch',        --, https://github.com/tpope/vim-dispatch
    'tpope/vim-projectionist',   --, https://github.com/tpope/vim-projectionist
    'jgdavey/vim-blockle',       --, https://github.com/gdavey/vim-blockle
    --'ruby-formatter/rufo-vim', --, https://github.com/ruby-formatter/rufo-vim

  requires = {
  'tpope/vim-rails'
  }
}

return M
