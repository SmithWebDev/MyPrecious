local install_path = os.getenv('HOME') .. '/.local/share/nvim/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  local plugin_repo = 'https://www.github.com/wbthomason/packer.nvim'
  local cli = string.format('!git clone %s %s', plugin_repo, install_path)
  vim.cmd(cli)
end

vim.cmd 'packadd packer.nvim'
local packer = require 'packer'

-- Use your local data path and not plugin/
-- this is `~/.local/share/nvim/site/plugin/packer_compiled.lua` in WSL/Linux and MacOS
packer.init {
  package_root = string.format('%s/site/pack', vim.fn.stdpath('data')),
  compile_path = string.format('%s/site/plugin/packer_compiled.lua', vim.fn.stdpath('data')),
  max_jobs = 30,
}

local plugins = {
  -- Aesthetics --
  'animate',      -- https://github.com/camspiers/animate.vim

  -- Editing --
  'surround',     -- https://github.com/tpope/vim-surround

  -- Git --
  'blamer',       -- https://github.com/APZelos/blamer.nvim
  'lazygit',      -- https://github.com/kdheepak/lazygit.nvim

  -- Qol --
  'easyalign',    -- https://github.com/junegunn/vim-easy-align
  'vim-smoothie', -- https://github.com/psliwka/vim-smoothie

  -- Treesitter/ Syntax Highlighting --
  'treesitter',   -- https://github.com/nvim-treesitter/nvim-treesitter
}

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'

  for _, v in pairs(plugins) do
    use(require('smithwebdev.plugins.configs.' .. v).plugin)
  end
end)

-- Autocmd to match the path in your config that is in
-- lua/smithwebdev/plugins/*.lua or lua/smithwebdev/plugins/configs/*.lua
-- and then create a packer compile file whenever you :w in those files
local packer_group = vim.api.nvim_create_augroup('packer_user_events', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  group = packer_group,

  pattern = '*.lua',

  callback = function(event)
    local found = event.file:find('.*smithwebdev/plugins.*') ~= nil

    if found then
      --vim.cmd 'PackerSync'
      vim.cmd 'PackerCompile'
    end
  end,
})

local u = require 'smithwebdev.core.utils'
local nnoremap = u.nnoremap

nnoremap('<leader>PS' , ':PackerSync<cr>'    , { desc = "Packer Sync" })
nnoremap('<leader>PC' , ':PackerCompile<cr>' , { desc = "Packer Compile" })

print('Plugins connected...')
