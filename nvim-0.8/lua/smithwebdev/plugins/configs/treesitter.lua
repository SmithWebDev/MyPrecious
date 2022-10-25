local M = {}

M.plugin = {
  'nvim-treesitter/nvim-treesitter',

  requires = {
    {'nvim-treesitter/playground',                 after = {'nvim-treesitter', 'tree-sitter-query'}}, -- https://github.com/nvim-treesitter/playground
    {'RRethy/nvim-treesitter-endwise',             after = {'nvim-treesitter', 'tree-sitter-query'}}, -- https://github.com/RRethy/nvim-treesitter-endwise
    {'nvim-treesitter/nvim-treesitter-refactor',   after = {'nvim-treesitter', 'tree-sitter-query'}}, -- https://github.com/nvim-treesitter/nvim-treesitter-refactor
    {'nvim-treesitter/nvim-treesitter-textobjects',after = {'nvim-treesitter', 'tree-sitter-query'}}, -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    {'RRethy/nvim-treesitter-textsubjects',        after = {'nvim-treesitter', 'tree-sitter-query'}}, -- https://github.com/RRethy/nvim-treesitter-textsubjects
    {'p00f/nvim-ts-rainbow',                       after = {'nvim-treesitter', 'tree-sitter-query'}}, -- https://github.com/p00f/nvim-ts-rainbow
    {'ziontee113/syntax-tree-surfer',              after = {'nvim-treesitter', 'tree-sitter-query'}}, -- https://github.com/ziontee113/syntax-tree-surfer
    {'nvim-treesitter/tree-sitter-query',          after = 'nvim-treesitter'},                        -- https://github.com/nvim-treesitter/tree-sitter-query
    {'windwp/nvim-ts-autotag',                     after = 'nvim-treesitter'},                        -- https://github.com/windwp/nvim-ts-autotag
    'nvim-treesitter/nvim-treesitter-context',                                                        -- https://github.com/nvim-treesitter/nvim-treesitter-context
  },

  run = function()
    require('nvim-treesitter.install').update({with_sync = true })
  end,

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        'css',
        'dockerfile',
        'elixir',
        'gitignore',
        'go',
        'graphql',
        'html',
        'javascript',
        'json',
        'json5',
        'lua',
        'markdown',
        'query',
        'regex',
        'ruby',
        'scss',
        'tsx',
        'typescript',
        'yaml'
      },
      sync_install = true,
      indent = {
        enable = true,
      },
      highlight = {
        enable = true,
        disable = { 'org' },
        additional_vim_regex_highlighting = { 'org' },
      },
      endwise = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
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
      autotag = {
        enable = true
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

    require('treesitter-context').setup{
      enable = true,
      max_lines = 0,
      trim_scope = 'outer',
      min_window_height = 0,
      patterns = {
        default = {
          'class',
          'function',
          'method',
          'for',
          'while',
          'if',
          'switch',
          'case',
          'def',
        },
      },
      zindex = 20,
      mode = 'cursor',
      separator = nil
    }
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
