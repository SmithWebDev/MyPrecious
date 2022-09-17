local M = {}

M.plugin = {
  'nvim-treesitter/playground', --https://github.com/nvim-treesitter/playground
  'RRethy/nvim-treesitter-endwise', -- https://github.com/RRethy/nvim-treesitter-endwise
  'nvim-treesitter/nvim-treesitter-refactor',
  'nvim-treesitter/nvim-treesitter-textobjects', -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  'RRethy/nvim-treesitter-textsubjects', -- https://github.com/RRethy/nvim-treesitter-textsubjects
  'nvim-treesitter/nvim-treesitter-context', --https://github.com/nvim-treesitter/nvim-treesitter-context
  'p00f/nvim-ts-rainbow', -- https://github.com/p00f/nvim-ts-rainbow

  requires = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/tree-sitter-query', -- https://github.com/nvim-treesitter/tree-sitter-query
  }
}

return M
