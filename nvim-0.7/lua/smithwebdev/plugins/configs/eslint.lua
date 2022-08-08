local M = {}

M.plugin = {
  'MunifTanjim/eslint.nvim', -- https://github.com/MunifTanjim/eslint.nvim

  requires = {
    'jose-elias-alvarez/null-ls.nvim'
  },

  config = function()
    local null_ls = require("null-ls")
    local eslint = require("eslint")

    null_ls.setup()
    eslint.setup({
      bin = 'eslint', -- or `eslint_d`
      code_actions = {
        enable = true,
        apply_on_save = {
          enable = true,
          types = { "problem" }, -- "directive", "problem", "suggestion", "layout"
        },
        disable_rule_comment = {
          enable = true,
          location = "separate_line", -- or `same_line`
        },
      },
      diagnostics = {
        enable = true,
        report_unused_disable_directives = false,
        run_on = "type", -- or `save`
      },
    })
  end
}

return M
