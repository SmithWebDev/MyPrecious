local M = {}

M.plugin = {
  'phaazon/mind.nvim', -- https://github.com/phaazon/mind.nvim

  branch = 'v2.2',

  requires = {'nvim-lua/plenary.nvim'},

  config = function()
    require'mind'.setup()

  end
}

return M
