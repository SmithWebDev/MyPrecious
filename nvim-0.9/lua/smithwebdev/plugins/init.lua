local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

plugins = {
  --[[ Colorschemes ]]--
  'B4mbus/oxocarbon-lua.nvim', --https://github.com/B4mbus/oxocarbon-lua.nvim
  'folke/tokyonight.nvim',  --https://github.com/folke/tokyonight.nvim

  --[[ Fuzzy / File Finder ]]--
  {
    'nvim-telescope/telescope.nvim', --https://github.com/nvim-telescope/telescope.nvim
    tag = '0.1.1', dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-media-files.nvim',  -- https://github.com/nvim-telescope/telescope-media-files.nvim
      'nvim-telescope/telescope-file-browser.nvim', -- https://github.com/nvim-telescope/telescope-file-browser.nvim,
      'nvim-telescope/telescope-frecency.nvim',     -- https://github.com/nvim-telescope/telescope-frecency.nvim
      'nvim-telescope/telescope-fzy-native.nvim',   -- https://github.com/nvim-telescope/telescope-fzy-native.nvim
      'benfowler/telescope-luasnip.nvim',           -- https://github.com/benfowler/telescope-luasnip.nvim
      'erlingur/telescope-rails-related-files',     -- https://github.com/erlingur/telescope-rails-related-files
      'ElPiloto/telescope-vimwiki.nvim',            -- https://github.com/ElPiloto/telescope-vimwiki.nvim
      'xiyaowong/telescope-octo-commands.nvim',     -- https://github.com/xiyaowong/telescope-octo-commands.nvim
    }
  },
}

require('lazy').setup(plugins, opts)
