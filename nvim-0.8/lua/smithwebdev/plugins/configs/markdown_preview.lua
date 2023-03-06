local M = {}

vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_page_title = '[${name}]'

M.plugin = {
  'iamcco/markdown-preview.nvim',

  run = 'cd app && npm install',

  config = function()

    --keybindings
    vim.keymap.set('n', '<leader><leader>mm', ':MarkdownPreviewToggle<cr>', { desc = 'Toggle Markdown file in default browser' })
    vim.keymap.set('n','<leader><leader>mo', ':MarkdownPreview<cr>', { desc = 'Open Markdown Preview' })
    vim.keymap.set('n','<leader><leader>ms', ':MarkdownPreviewStop<cr>', {desc = 'Stop Markdown Preview' })
  end
}

return M
