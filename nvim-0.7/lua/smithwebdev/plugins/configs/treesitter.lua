local M = {}

M.plugin = {
  'nvim-treesitter/nvim-treesitter',

  requires = {
  'nvim-treesitter/playground', --https://github.com/nvim-treesitter/playground
    'RRethy/nvim-treesitter-endwise',              -- https://github.com/RRethy/nvim-treesitter-endwise
    'nvim-treesitter/nvim-treesitter-refactor',
    'nvim-treesitter/nvim-treesitter-textobjects', -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    'RRethy/nvim-treesitter-textsubjects',         -- https://github.com/RRethy/nvim-treesitter-textsubjects
  },

  run = ':TSUpdate',

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        'lua',
        'ruby',
        'html',
        'css',
        'javascript',
        'query',
      },
      sync_install = true,
      indent = {
        enable = true,
      },
      highlight = {
        enable = true,
        disable = {'org'},
        additional_vim_regex_highlighting = {'org'},
      },
      endwise = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            --['af'] = '@function.outer',
            --['if'] = '@function.inner',
            --['ac'] = '@class.outer',
            --['ic'] = '@class.inner',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            --[''] = '@parameter.inner',
          },
          swap_previous = {
            --[''] = '@parameter.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            --[']f'] = '@function.outer',
            --[']c'] = '@class.outer',
          },
          goto_next_end = {
            --[']F'] = '@function.outer',
            --[']C'] = '@class.outer',
          },
          goto_previous_start = {
            --['[f'] = '@function.outer',
            --['[c'] = '@class.outer',
          },
          goto_previous_end = {
            --['[F'] = '@function.outer',
            --['[C'] = '@class.outer',
          },
        },
      },
      textsubjects = {
        enable = true,
        -- prev_selection = '', -- optional keymap to select the previous selection
        keymaps = {
          -- [''] = 'textsubjects-smart',
          -- [''] = 'textsubjects-container-outer',
          -- [''] = 'textsubjects-container-inner',
        },
      },
    })
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  end
}

return M

-- Built-In Text Objects
-- Ruby x = available  o = unavailable
-- x @block.inner
-- x @block.outer
-- o @call.inner
-- o @call.outer
-- x @class.inner
-- x @class.outer
-- o @comment.outer
-- o @conditional.inner
-- o @conditional.outer
-- o @frame.inner
-- o @frame.outer
-- x @function.inner
-- x @function.outer
-- o @loop.inner
-- o @loop.outer
-- x @parameter.inner
-- x @parameter.outer
-- o @scopename.inner
-- o @statement.outer
