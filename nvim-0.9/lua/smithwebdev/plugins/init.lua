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
  {
    'folke/tokyonight.nvim',  --https://github.com/folke/tokyonight.nvim
    config = function()
      require('smithwebdev.plugins.configs.tokyonight')
    end
  },
  'vim-scripts/ScrollColors', -- https://github.com/vim-scripts/ScrollColors
  'yonlu/omni.vim', -- https://github.com/yonlu/omni.vim
  'ldelossa/vimdark', -- https://github.com/ldelossa/vimarkd
  'flazz/vim-colorschemes', --https://github.com/flazz/vim-colorschemes
  'rafi/awesome-vim-colorschemes', --https://github.com/rafi/awesome-vim-colorschemes
  'numToStr/Sakura.nvim', --https://github.com/numToStr/Sakura.nvim

  --[[ Completion/ Snippets ]]--
  {
    'L3MON4D3/LuaSnip', -- https://github.com/L3MON4D3/LuaSnip
    version = '1.*', build = 'make install_jsregexp',
    config = function()
      require('smithwebdev.plugins.configs.luasnip')
    end
  },
  {
    'danymat/neogen', -- https://github.com/danymat/neogen
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true, version = "*"
  },
  {
    'hrsh7th/nvim-cmp', -- https://www.github.com/hrsh7th/nvim-cmp
    dependencies = {
      'saadparwaiz1/cmp_luasnip',            -- https://github.com/saadparwaiz1/cmp_luasnip
      'hrsh7th/cmp-buffer',                  -- https://github.com/hrsh7th/cmp-buffer
      'jcha0713/cmp-tw2css',                 -- https://github.com/jcha0713/cmp-tw2css
      'hrsh7th/cmp-emoji',                   -- https://github.com/hrsh7th/cmp-emoji
      'hrsh7th/cmp-path',                    -- https://github.com/hrsh7th/cmp-path
      'hrsh7th/cmp-cmdline',                 -- https://github.com/hrsh7th/cmp-cmdline
      'hrsh7th/cmp-nvim-lsp',                -- https://github.com/hrsh7th/cmp-nvim-lsp
      'hrsh7th/cmp-nvim-lsp-signature-help', -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
      'hrsh7th/cmp-nvim-lua',                -- https://github.com/hrsh7th/cmp-nvim-lua
      'windwp/nvim-autopairs',               -- https://github.com/windwp/nvim-autopairs
      'kyazdani42/nvim-web-devicons',        -- https://github.com/kyazdani42/nvim-web-devicons
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('smithwebdev.plugins.configs.autopairs')
      require('smithwebdev.plugins.configs.cmp')
    end
  },
  'honza/vim-snippets',           -- https://github.com/honza/vim-snippets
  'rafamadriz/friendly-snippets', -- https://github.com/rafamadriz/friendly-snippets

  --[[ Editing / Syntax ]]--
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('smithwebdev.plugins.configs.treesitter')
    end
  },

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
    },
    config = function()
      require('smithwebdev.plugins.configs.telescope')
    end
  },
}

require('lazy').setup(plugins, opts)
