local M = {}

M.plugin = {
  'michaelb/sniprun',

  -- In order to ensure the installer runs, MacOS requires Rust Toolchain to be
  -- installed. The Rust Toolchain can be found here: https://www.rust-lang.org/tools/install

  run = 'bash ./install.sh',

  config = function()
    -- keybinds
    local u = require'smithwebdev.core.utils'
    local nnoremap = u.nnoremap
    local vnoremap = u.vnoremap

    nnoremap('<leader>sc', ':SnipClose<CR>',      { desc = 'Remove SnipRun code comments'})
    nnoremap('<leader>sc', ':SnipInfo<CR>',      { desc = ''})
    nnoremap('<leader>sr', ':SnipRun<CR>',      { desc = 'Runs code block in editor'})
    vnoremap('<leader>sr', ":'<,'>SnipRun<CR>", { desc = 'Runs code block in editor'})
  end
}

return M
