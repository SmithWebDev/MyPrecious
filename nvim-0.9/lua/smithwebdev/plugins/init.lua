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

local plugins = {

  --[[ Colorschemes ]]--
  ------------------------------------------------------------------------------
  'B4mbus/oxocarbon-lua.nvim',                        --https://github.com/B4mbus/oxocarbon-lua.nvim
  {
    'folke/tokyonight.nvim',                          --https://github.com/folke/tokyonight.nvim
    config = function()
      require('smithwebdev.plugins.configs.tokyonight')
    end
  },
  'vim-scripts/ScrollColors',                         -- https://github.com/vim-scripts/ScrollColors
  'yonlu/omni.vim',                                   -- https://github.com/yonlu/omni.vim
  'ldelossa/vimdark',                                 -- https://github.com/ldelossa/vimarkd
  'flazz/vim-colorschemes',                           --https://github.com/flazz/vim-colorschemes
  'rafi/awesome-vim-colorschemes',                    --https://github.com/rafi/awesome-vim-colorschemes
  'numToStr/Sakura.nvim',                             --https://github.com/numToStr/Sakura.nvim

  --[[ Completion/ Snippets ]]--
  ------------------------------------------------------------------------------
  'rafamadriz/friendly-snippets',                     -- https://github.com/rafamadriz/friendly-snippets
  {
    'L3MON4D3/LuaSnip',                               -- https://github.com/L3MON4D3/LuaSnip
    version = '1.*',
    build = 'make install_jsregexp',
    config = function()
      require('smithwebdev.plugins.configs.luasnip')
    end
  },
  {
    'danymat/neogen',                                 -- https://github.com/danymat/neogen
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true,
    version = "*"
  },
  {
    'hrsh7th/nvim-cmp',                               -- https://www.github.com/hrsh7th/nvim-cmp
    dependencies = {
      'saadparwaiz1/cmp_luasnip',                     -- https://github.com/saadparwaiz1/cmp_luasnip
      'hrsh7th/cmp-buffer',                           -- https://github.com/hrsh7th/cmp-buffer
      'jcha0713/cmp-tw2css',                          -- https://github.com/jcha0713/cmp-tw2css
      'hrsh7th/cmp-emoji',                            -- https://github.com/hrsh7th/cmp-emoji
      'hrsh7th/cmp-path',                             -- https://github.com/hrsh7th/cmp-path
      'hrsh7th/cmp-cmdline',                          -- https://github.com/hrsh7th/cmp-cmdline
      'hrsh7th/cmp-nvim-lsp',                         -- https://github.com/hrsh7th/cmp-nvim-lsp
      'hrsh7th/cmp-nvim-lsp-signature-help',          -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
      'hrsh7th/cmp-nvim-lua',                         -- https://github.com/hrsh7th/cmp-nvim-lua
      'windwp/nvim-autopairs',                        -- https://github.com/windwp/nvim-autopairs
      'kyazdani42/nvim-web-devicons',                 -- https://github.com/kyazdani42/nvim-web-devicons
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('smithwebdev.plugins.configs.autopairs')
      require('smithwebdev.plugins.configs.cmp')
    end
  },
  {
    'ziontee113/SnippetGenie',                        -- https://github.com/ziontee113/SnippetGenie
    config = function()
      require('smithwebdev.plugins.configs.snippetgenie')
    end
  },
  'honza/vim-snippets',                               -- https://github.com/honza/vim-snippets

  --[[ Editing / Syntax ]]--
  ------------------------------------------------------------------------------
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/playground',                   -- https://github.com/nvim-treesitter/playground
      'RRethy/nvim-treesitter-endwise',               -- https://github.com/RRethy/nvim-treesitter-endwise
      'nvim-treesitter/nvim-treesitter-refactor',     -- https://github.com/nvim-treesitter/nvim-treesitter-refactor
      'nvim-treesitter/nvim-treesitter-textobjects',  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      'RRethy/nvim-treesitter-textsubjects',          -- https://github.com/RRethy/nvim-treesitter-textsubjects
      'HiPhish/nvim-ts-rainbow',                      -- https://github.com/HiPhish/nvim-ts-rainbow
      'ziontee113/syntax-tree-surfer',                -- https://github.com/ziontee113/syntax-tree-surfer
      'nvim-treesitter/tree-sitter-query',            -- https://github.com/nvim-treesitter/tree-sitter-query
      'windwp/nvim-ts-autotag',                       -- https://github.com/windwp/nvim-ts-autotag
      'nvim-treesitter/nvim-treesitter-context',      -- https://github.com/nvim-treesitter/nvim-treesitter-context
    },
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
      require('smithwebdev.plugins.configs.treesitter')
    end
  },

  --[[ Fuzzy / File Finder ]]--
  ------------------------------------------------------------------------------
  {
    'nvim-neo-tree/neo-tree.nvim',                    -- https://github.com/nvim-neo-tree/neo-tree.nvim
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-tree/nvim-web-devicons',
        name = 'web-icons'
      },
      'MunifTanjim/nui.nvim',
      {
        's1n7ax/nvim-window-picker',                  -- https://github.com/s1n7ax/nvim-window-picker
        version = '1.*'
      },
    },
    version = '2.*',
    config = function()
      require('smithwebdev.plugins.configs.neotree')
      require('smithwebdev.plugins.configs.nvim_window_picker')
    end
  },
  {
    'nvim-telescope/telescope.nvim',                  --https://github.com/nvim-telescope/telescope.nvim
    tag = '0.1.1',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-media-files.nvim',    -- https://github.com/nvim-telescope/telescope-media-files.nvim
      'nvim-telescope/telescope-file-browser.nvim',   -- https://github.com/nvim-telescope/telescope-file-browser.nvim,
      'nvim-telescope/telescope-frecency.nvim',       -- https://github.com/nvim-telescope/telescope-frecency.nvim
      'nvim-telescope/telescope-fzy-native.nvim',     -- https://github.com/nvim-telescope/telescope-fzy-native.nvim
      'benfowler/telescope-luasnip.nvim',             -- https://github.com/benfowler/telescope-luasnip.nvim
      'erlingur/telescope-rails-related-files',       -- https://github.com/erlingur/telescope-rails-related-files
      'ElPiloto/telescope-vimwiki.nvim',              -- https://github.com/ElPiloto/telescope-vimwiki.nvim
      'xiyaowong/telescope-octo-commands.nvim',       -- https://github.com/xiyaowong/telescope-octo-commands.nvim
    },
    config = function()
      require('smithwebdev.plugins.configs.telescope')
    end
  },

  --[[ Filetype ]]--
  ------------------------------------------------------------------------------
  {
    'weizheheng/ror.nvim',                            -- https://github.com/weizheheng/ror.nvim
    dependencies = {
      'rcarriga/nvim-notify',                         -- https://github.com/rcarriga/nvim-notify
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('smithwebdev.plugins.configs.ror')
    end
  },

  --[[ LSP ]]--
  ------------------------------------------------------------------------------
  'glepnir/lspsaga.nvim', -- https://github.com/glepnir/lspsaga.nvim
  {
    'VonHeikemen/lsp-zero.nvim',                      -- https://github.com/VonHeikemen/lsp-zero.nvim/
    dependencies = {
      'neovim/nvim-lspconfig',                        -- https://github.com/neovim/nvim-lspconfig
      'williamboman/mason.nvim',                      -- https://github.com/williamboman/mason.nvim
      'williamboman/mason-lspconfig.nvim',            -- https://github.com/williamboman/mason-lspconfig.nvim
      'hrsh7th/nvim-cmp',                             -- https://github.com/hrsh7th/nvim-cmp
      'hrsh7th/cmp-buffer',                           -- https://github.com/hrsh7th/cmp-buffer
      'hrsh7th/cmp-path',                             -- https://github.com/hrsh7th/cmp-path
      'saadparwaiz1/cmp_luasnip',                     -- https://github.com/saadparwaiz1/cmp_luasnip
      'hrsh7th/cmp-nvim-lsp',                         -- https://github.com/hrsh7th/cmp-nvim-lsp
      'hrsh7th/cmp-nvim-lua',                         -- https://github.com/hrsh7th/cmp-nvim-lua

      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require("smithwebdev.plugins.configs.lsp_zero")
    end
  },
  {
    'ray-x/navigator.lua',                            -- https://github.com/ray-x/navigator.lua
    dependencies = {
      {
        'ray-x/guihua.lua',
        build = 'cd lua/fzy && make',
      },
      'neovim/nvim-lspconfig',
      {
        'ray-x/lsp_signature.nvim',                   -- https://github.com/ray-x/lsp_signature.nvim
        config = function()
          require('smithwebdev.plugins.configs.lsp_signature')
        end
      },
      {
        'nvim-treesitter/nvim-treesitter',
      },
    },
    config = function()
      require('smithwebdev.plugins.configs.navigator')
    end
  },

  --[[ QOL ]]--
  ------------------------------------------------------------------------------
  {
    'rcarriga/nvim-notify',                           -- https://github.com/rcarriga/nvim-notify
    config = function()
      require('smithwebdev.plugins.configs.nvim_notify')
    end
  },
  'junegunn/vim-easy-align',
}

require('lazy').setup(plugins, opts)
