local M = {}

M.plugin = {
  'numToStr/Comment.nvim', -- https://github.com/numToStr/Comment.nvim,

  config = function()
    require("Comment").setup()
  end
}

return M
