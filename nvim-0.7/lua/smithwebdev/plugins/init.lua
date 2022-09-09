local install_path = os.getenv('HOME') .. '/.local/share/nvim/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  local plugin_repo = 'https://github.com/wbthomason/packer.nvim'
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

  -- =Aesthetics= --
  'animate',                -- https://github.com/camspiers/animate.vim
  'colorbuddy',             -- https://github.com/tjdevries/colorbuddy.nvim
  'colorscheme',
  'indent_blankline',       -- https://github.com/lukas-reineke/indent-blankline.nvim
  'lush',                   -- https://github.com/rktjmp/lush.nvim
  'oxocarbon',              -- https://github.com/shaunsingh/oxocarbon.nvim
  'statusline',             -- https://github.com/beauwilliams/statusline.lua
  'tabular',                -- https://github.com/godlygeek/tabular
  'transparent',            -- https://github.com/xiyaowong/nvim-transparent
  'vim-smoothie',           -- https://github.com/psliwka/vim-smoothie

  -- Completion & Snippets --
  'luasnip',                -- https://github.com/L3MON4D3/LuaSnip
  'cmp',                    -- https://github.com/hrsh7th/nvim-cmp
  'cheat_sheet',            -- https://github.com/Djancyp/cheat-sheet
  'nvim-ufo',               -- https://github.com/kevinhwang91/nvim-ufo

  -- Editing --
  'autopairs',              -- https://github.com/windwp/nvim-autopairs
  'bqf',                    -- https://github.com/kevinhwang91/nvim-bqf
  'color-converter',        -- https://github.com/NTBBloodbath/color-converter.nvim
  'colorizer',              -- https://github.com/norcalli/nvim-colorizer.lua
  'color-picker',           -- https://github.com/ziontee113/color-picker.nvim
  'comment',                -- https://github.com/numToStr/Comment.nvim
  'easyalign',              -- https://github.com/junegunn/vim-easy-align
  'emmet',                  -- https://github.com/mattn/emmet-vim
  'fold-preview',           -- https://github.com/anuvyklack/fold-preview.nvim
  'hlslens',                -- https://github.com/kevinhwang91/nvim-hlslens
  'leap',                   -- https://github.com/ggandor/leap.nvim
  'marks',                  -- https://github.com/chentau/marks.nvim
  'peekabo',                -- https://github.com/junegunn/vim-peekaboo
  'splitjoin',              -- https://github.com/AndrewRadev/splitjoin.vim
  'surround',               -- https://github.com/tpope/vim-surround
  'targets',                -- https://github.com/wellle/targets.vim
  'toggleterm',             -- https://github.com/akinsho/toggleterm.nvim
  'traces',                 -- https://github.com/markonm/traces.vim
  'treesurfer',             -- https://github.com/ziontee113/syntax-tree-surfer
  'truezen',                -- https://github.com/Pocco81/true-zen.nvim

  'vim-exchange',           -- https://github.com/tommcdo/vim-exchange
  'visual-multi',           -- https://github.com/mg979/vim-visual-multi
  'yode',                   -- https://github.com/hoschi/yode-nvim

  -- Filetype --
  'dash',                   -- https://github.com/mrjones2014/dash.nvim  **
  'haml',                   -- https://github.com/tpope/vim-haml
  'markdown_preview',       -- https://github.com/iamcco/markdown-preview.nvim
  'rails',                  -- https://github.com/tpope/vim-rails
  'sniprun',                -- https://github.com/michaelb/sniprun
  --'vim-ruby-refactoring', -- https://github.com/ecomba/vim-ruby-refactoring

  -- Formatting--
  'eslint',                 -- https://github.com/MunifTanjim/eslint.nvim
  'prettier',               -- https://github.com/MunifTanjim/prettier.nvim

  -- Fuzzy / File Finder --
  --'aerial',               -- https://github.com/stevearc/aerial.nvim
  'harpoon',                -- https://github.com/ThePrimeagen/harpoon
  'lir',                    -- https://github.com/tamago324/lir.nvim
  'telescope',              -- https://github.com/nvim-telescope/telescope.nvim

  -- Git --
  'blamer',                 -- https://github.com/APZelos/blamer.nvim
  'gh',                     -- https://github.com/ldelossa/gh.nvim
  'lazygit',                -- https://github.com/kdheepak/lazygit.nvim
  'octo',                   -- https://github.com/pwntester/octo.nvim

  -- Keybinds --
  'hydra',                  -- https://github.com/anuvyklack/hydra.nvim
  'whichkey',               -- https://github.com/folke/which-key.nvim

  -- LSP--
  --'lspconfig',
  'lspsaga',
  'lsp_lines',              -- https://github.com/Maan2003/lsp_lines.nvim
  'mason',                  -- https://github.com/williamboman/mason.nvim
  'navigator',              -- https://github.com/ray-x/navigator.lua
  'trouble',                -- https://github.com/folke/trouble.nvim


  -- Project Organization --
  'buffertag',              -- https://github.com/ldelossa/buffertag
  'gutentags',              -- https://github.com/ludovicchabant/vim-gutentags
  --'orgmode',              -- https://github.com/nvim-orgmode/orgmode
  --'vim-mkdir',            -- https://github.com/pbrisbin/vim-mkdir
  'vim-wakatime',           -- https://github.com/wakatime/vim-wakatime
  'vimwiki',                -- https://github.com/vimwiki/vimwiki

  -- Testing --
  --'coverage',             -- https://github.com/andythigpen/nvim-coverage
  --'dispatch',             -- https://github.com/tpope/vim-dispatch
  'vim-ultest',             -- https://github.com/rcarriga/vim-ultest
  'neotest',                -- https://github.com/rcarriga/neotest

  -- Treesitter/ Syntax Highlighting --
  'treesitter',             -- https://github.com/nvim-treesitter/nvim-treesitter
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
