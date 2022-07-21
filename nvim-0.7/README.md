# Nightly Configuration

The basis of this configuration is to continue to build on my understanding of
Neovim, prepare for the upcoming release of 0.7 version, and to further polish
my axe. Within this configuration file, the goal is to provide a DRY and modular
experience when changes or updates are needed/ performed.

All Plugins listed will have their own file that includes any dependencies or
additional plugins that support the main plugin. This helps to keep the plugin
init file clean, while keeping the responsibility of each plugin tightly
coupled.

#### TODO
- Attempt to find a solution to make snippets more modular. Instead of one large file, there should be a way to not only break into filetypes, but to create the snippet based on the filetype of file currently working on
  - UPDATE: Luasnip and cmp now working properly, but still havent split the
    snippets into their own files.
  - NEW HEADACHE: Realizing that a lot of my config requires a relaunch of the
    application with each change. Hopefully will find a resolution while being
    able to maintain the current format or have very little change necessary...
    ie Pray for me

#### Included Plugins

- File Finders
  - [harpoon](https://github.com/ThePrimeagen/harpoon) "Yeah Yeah"
  - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- FileType Specific Plugins
  - [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
  - [vim-rails](https://github.com/tpope/vim-rails)
  - [sniprun](https://github.com/michaelb/sniprun)
- Git
  - [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)
- Keybindings Reference
  - [which-key.nvim](https://github.com/folke/which-key.nvim)
- Snippets and Completion Plugins
  - [luaSnip](https://github.com/L3MON4D3/LuaSnip)
  - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
    - Additional CMP Plugins
      - [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
      - [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
      - [cmp-look](https://github.com/octaltree/cmp-look)
      - [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
      - [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
      - [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)
      - [cmp-nvim-tags](https://github.com/quangnguyen30192/cmp-nvim-tags)
      - [cmp-path](https://github.com/hrsh7th/cmp-path)
      - [cmp-treesitter](https://github.com/ray-x/cmp-treesitter)
    - Premade Snippet Plugins
      - [vim-snippets](https://github.com/honza/vim-snippets)
      - [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- Treesitter/ Syntax Highlighting
  - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
    - [nvim-treesitter-endwise](https://github.com/RRethy/nvim-treesitter-endwise)
    - [playground](https://github.com/nvim-treesitter/playground)
- Useful Editor Improvements
  - [emmet-vim](https://github.com/mattn/emmet-vim)
  - [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
  - [marks.nvim](https://github.com/chentau/marks.nvim)
  - [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)
  - [vim-easy-align](https://github.com/junegunn/vim-easy-align)
  - [vim-peekaboo](https://github.com/junegunn/vim-peekaboo)
  - [vim-surround](https://github.com/tpope/vim-surround)
- **PURELY FOR AESTHETICS**
  - [animate.vim](https://github.com/camspiers/animate.vim)
    - [lens.vim](https://github.com/camspiers/lens.vim)
  - [vim-smoothie](https://github.com/psliwka/vim-smoothie)

#### Inspirations
[Elianiva's Dotfiles](https://github.com/elianiva/dotfiles/tree/master/config/nvim)


