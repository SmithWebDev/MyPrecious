local M = {}

vim.opt.termguicolors = true

vim.g.oxocarbon_lua_transparent = true
--vim.g.oxocarbon_lua_alternative_telescope = true
vim.g.tokyonight_style = 'night'
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_functions = true


M.plugin = {
  'B4mbus/oxocarbon-lua.nvim', --https://github.com/B4mbus/oxocarbon-lua.nvim
  'Th3Whit3Wolf/spacebuddy', -- https://github.com/Th3Whit3Wolf/spacebuddy
  'djjcast/mirodark', -- https://github.com/djjcast/mirodark
  'bkegley/gloombuddy', -- https://github.com/bkegley/gloombuddy
  'mrjones2014/lighthaus.nvim', -- https://github.com/mrjones2014/lighthaus.nvim
  'folke/tokyonight.nvim', -- https://github.com/folke/tokyonight.nvim
  'shaunsingh/moonlight.nvim', --  https://github.com/shaunsingh/moonlight.nvim
  'vim-scripts/ScrollColors', -- https://github.com/vim-scripts/ScrollColors
  'yonlu/omni.vim', -- https://github.com/yonlu/omni.vim
  'ldelossa/vimdark', -- https://github.com/ldelossa/vimarkd
  'flazz/vim-colorschemes', --https://github.com/flazz/vim-colorschemes
  'rafi/awesome-vim-colorschemes', --https://github.com/rafi/awesome-vim-colorschemes
  'numToStr/Sakura.nvim', --https://github.com/numToStr/Sakura.nvim

  requires = {
    'tjdevries/colorbuddy.nvim', -- https://github.com/tjdevries/colorbuddy.nvim
    },

  config = function()
    end
}

return M
