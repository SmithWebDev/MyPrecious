local M = {}

M.plugin = {
  'stevearc/aerial.nvim',-- https://github.com/stevearc/aerial.nvim

  config = function()

    require("aerial").setup({
      backends = {'treesitter', 'lsp'},
      close_behavior = 'auto',
      default_bindings = false,
      default_direction = "prefer_right",
      disable_max_lines = 100000,
      disable_max_size = 1000000000,
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
      },
      highlight_mode = "split_width",
      highlight_closest = true,
      highlight_on_hover = false,
      highlight_on_jump = 300,
      link_folds_to_tree = false,
      link_tree_to_folds = true,
      manage_folds = false,
      max_width = { 40, 0.2 },
      width = nil,
      min_width = 10,
      nerd_font = "auto",
      lsp = {
        -- Fetch document symbols when LSP diagnostics update.
        -- If false, will update on buffer changes.
        diagnostics_trigger_update = true,

        -- Set to false to not update the symbols when there are LSP errors
        update_when_errors = true,

        -- How long to wait (in ms) after a buffer change before updating
        -- Only used when diagnostics_trigger_update = false
        update_delay = 300,
      },

      treesitter = {
        -- How long to wait (in ms) after a buffer change before updating
        update_delay = 300,
      },

      markdown = {
        -- How long to wait (in ms) after a buffer change before updating
        update_delay = 300,
      },
    })

    local u = require'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

    nnoremap('<leader>aa', '<cmd>AerialToggle!<CR>', { desc = 'Toggle Aerial' })
    -- Jump forwards/backwards with ' ap' and ' an'
    nnoremap('<leader>ap', '<cmd>AerialPrev<CR>', { desc = 'Aerial Previous' })
    nnoremap('<leader>an', '<cmd>AerialNext<CR>', { desc = 'Aerial Next' })
    -- Jump up the tree with ' a[' or ' a]'
    nnoremap('<leader>a[', '<cmd>AerialPrevUp<CR>', { desc = 'Aerial Previous Up' })
    nnoremap('<leader>a]', '<cmd>AerialNextUp<CR>', { desc = 'Aerial Previous Next' })
  end
}

return M
