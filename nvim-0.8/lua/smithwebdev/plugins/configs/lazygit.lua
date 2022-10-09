local M = {}

M.plugin = {
  'kdheepak/lazygit.nvim',

  config = function()
    -- keybindings
    local default_opts = {noremap = true, silent = true}
    vim.api.nvim_set_keymap('n', '<leader>gl', '<cmd>LazyGit<CR>', default_opts)
  end
}

return M
