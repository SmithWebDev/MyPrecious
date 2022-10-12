local M = {}

vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_page_title = '[${name}]'

M.plugin = {
  'iamcco/markdown-preview.nvim',

  run = 'cd app && npm install',

  config = function()
    local u = require'smithwebdev.core.utils'
    local noremap = u.noremap
    local nnoremap = u.nnoremap
    local inoremap = u.inoremap
    local vnoremap = u.vnoremap

    --keybindings
    nnoremap('<leader><leader>mm', ':MarkdownPreviewToggle<cr>', { desc = 'Toggle Markdown file in default browser' })
    nnoremap('<leader><leader>mo', ':MarkdownPreview<cr>', { desc = 'Open Markdown Preview' })
    nnoremap('<leader><leader>ms', ':MarkdownPreviewStop<cr>', {desc = 'Stop Markdown Preview' })
  end
}

return M
