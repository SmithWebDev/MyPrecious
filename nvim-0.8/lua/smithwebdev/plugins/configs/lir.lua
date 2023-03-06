local M = {}

M.plugin = {
  'tamago324/lir.nvim',
  requires = {
    'kyazdani42/nvim-web-devicons', --https://github.com/kyazdani42/nvim-web-devicons
    'tamago324/lir-bookmark.nvim', --https://github.com/tamago324/lir-bookmark.nvim
    'tamago324/lir-git-status.nvim', --https://github.com/tamago324/lir-git-status.nvim
  },
  config = function()
    local actions           = require 'lir.actions'
    local b_actions         = require 'lir.bookmark.actions'
    local mark_actions      = require 'lir.mark.actions'
    local clipboard_actions = require 'lir.clipboard.actions'

    require 'lir'.setup {
      show_hidden_files = true,
      devicons = {
        enable = true
      },
      float = {
        winblend = 0,
        curdir_window = {
          enable = false,
          highlight_dirname = false
        },
      },
      hide_cursor = true,
      on_init = function()
        vim.api.nvim_buf_set_keymap(
          0,
          'x',
          'J',
          ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
          { noremap = true, silent = true }
        )
        vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
      end,
      mappings = {
        ['e']    = actions.edit,
        ['<CR>'] = actions.edit,
        ['-']    = actions.split,
        ['\\']   = actions.vsplit,
        ['t']    = actions.tabedit,

        ['<BS>'] = actions.up,
        ['q']    = actions.quit,

        ['A']    = actions.mkdir,
        ['a']    = actions.newfile,
        ['r']    = actions.rename,
        ['C']    = actions.cd,
        ['Y']    = actions.yank_path,
        ['.']    = actions.toggle_show_hidden,
        ['d']    = actions.delete,

        ['J']    = function()
          mark_actions.toggle_mark()
          vim.cmd('normal! j')
        end,

        ['c']    = clipboard_actions.copy,
        ['x']    = clipboard_actions.cut,
        ['p']    = clipboard_actions.paste,

        ['B']    = require 'lir.bookmark.actions'.list,
        ['ba']   = require 'lir.bookmark.actions'.add,
      },
    }

    require 'lir.bookmark'.setup {
      bookmark_path = '~/.lir_bookmark',
      mappings      = {
        ['e']    = b_actions.edit,
        ['-']    = b_actions.split,
        ['\\']   = b_actions.vsplit,
        ['t']    = b_actions.tabedit,
        ['<CR>'] = b_actions.open_lir,
      }
    }
    -- custom folder icon
    require 'nvim-web-devicons'.set_icon({
      lir_folder_icon = {
        icon = "",
        color = "#7ebae4",
        name = "LirFolderNode"
      }
    })

    require 'lir.git_status'.setup({
      show_ignored = false
    })

    -- keybinds
    local u        = require 'smithwebdev.core.utils'
    local noremap  = u.noremap
    local nnoremap = u.nnoremap
    local inoremap = u.inoremap
    local tnoremap = u.tnoremap
    local vnoremap = u.vnoremap

    nnoremap('<leader><leader>f', ':lua require"lir.float".toggle()<CR>', { desc = 'Toggle floating directory window' })
  end
}

return M
