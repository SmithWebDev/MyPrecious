local M = {}

M.plugin = {
    'nvim-telescope/telescope-media-files.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-frecency.nvim',
    'nvim-telescope/telescope-fzy-native.nvim',
    'benfowler/telescope-luasnip.nvim',
    'erlingur/telescope-rails-related-files', -- https://github.com/erlingur/telescope-rails-related-files
    'ElPiloto/telescope-vimwiki.nvim', -- https://github.com/ElPiloto/telescope-vimwiki.nvim
    --'Zane-/cder.nvim', --https://github.com/Zane-/cder.nvim

  requires = {
    'nvim-telescope/telescope.nvim'
  }
}

return M
