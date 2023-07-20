require('telescope').setup({
  defaults = {
    layout_config = { prompt_position = 'bottom' },
    layout_strategy = 'horizontal',
    sorting_strategy = 'descending',
    mappings = {
      ['i'] = {
        ['<esc>'] = require("telescope.actions").close,
        ['<C-s>'] = require('telescope.actions').add_selection,
        ['<C-x>'] = require('telescope.actions').remove_selection,
        ['<C-j>'] = require('telescope.actions').move_selection_next,
        ['<C-k>'] = require('telescope.actions').move_selection_previous,
        ['<C-v>'] = require('telescope.actions').move_selection_previous,
        ['<leader>-'] = require('telescope.actions').select_horizontal,
        ['<leader>\\'] = require('telescope.actions').select_vertical,
        ['<C-h>'] = require('telescope.actions').add_to_qflist,
        --['<C-a>'] = require('telescope.actions').add_selected_to_qflist,
        ['<C-q>'] = require('telescope.actions').send_selected_to_qflist,
        ['ja'] = require'telescope'.extensions.send_to_harpoon.actions.send_selected_to_harpoon
      },
      ['n'] = {
        ['<esc>'] = require("telescope.actions").close,
        ['<C-s>'] = require('telescope.actions').add_selection,
        ['<C-x>'] = require('telescope.actions').remove_selection,
        ['<C-j>'] = require('telescope.actions').move_selection_next,
        ['<C-k>'] = require('telescope.actions').move_selection_previous,
        ['-'] = require('telescope.actions').select_horizontal,
        ['\\'] = require('telescope.actions').select_vertical,
        ['t'] = require('telescope.actions').select_tab,
        ['<C-h>'] = require('telescope.actions').add_to_qflist,
        ['<C-a>'] = require('telescope.actions').add_selected_to_qflist,
        ['<C-q>'] = require('telescope.actions').send_selected_to_qflist,
        ['q'] = require('telescope.actions').open_qflist,
        ['?'] = require('telescope.actions').which_key,
      }
    },
  },

})

local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

telescope.load_extension('file_browser')
telescope.load_extension('luasnip')
telescope.load_extension('rails_related_files')
telescope.load_extension('vimwiki')
telescope.load_extension('octo_commands')
telescope.load_extension('send_to_harpoon')

vim.keymap.set('n', '<leader>fc',  telescope_builtin.commands,             { desc = 'Telescope Commands',            silent = true })
vim.keymap.set('n', '<leader>fC',  telescope_builtin.command_history,      { desc = 'Telescope Command History',     silent = true })
vim.keymap.set('n', '<leader>ff',  telescope_builtin.find_files,           { desc = 'Telescope Find Files',          silent = true })
vim.keymap.set('n', '<leader>fg',  telescope_builtin.live_grep,            { desc = 'Telescope Live Grep',           silent = true })
vim.keymap.set('n', '<leader>fG',  telescope_builtin.git_files,            { desc = 'Telescope Git Files',           silent = true })
vim.keymap.set('n', '<leader>fGb', telescope_builtin.git_bcommits,         { desc = 'Telescope Git BCommits',        silent = true })
vim.keymap.set('n', '<leader>fGB', telescope_builtin.git_branches,         { desc = 'Telescope Branches',            silent = true })
vim.keymap.set('n', '<leader>fGc', telescope_builtin.git_commits,          { desc = 'Telescope Commits',             silent = true })
vim.keymap.set('n', '<leader>fh',  telescope_builtin.help_tags,            { desc = 'Telescope Help Tags',           silent = true })
vim.keymap.set('n', '<leader>fj',  telescope_builtin.jumplist,             { desc = 'Telescope Jumplist',            silent = true })
vim.keymap.set('n', '<leader>fk',  telescope_builtin.keymaps,              { desc = 'Telescope Keymaps',             silent = true })
vim.keymap.set('n', '<leader>fld', telescope_builtin.lsp_definitions,      { desc = 'Telescope Lsp Definitions',     silent = true })
vim.keymap.set('n', '<leader>flD', telescope_builtin.lsp_document_symbols, { desc = 'Telescope Lsp Document Symbol', silent = true })
vim.keymap.set('n', '<leader>fli', telescope_builtin.lsp_implementations,  { desc = 'Telescope Lsp Implementations', silent = true })
vim.keymap.set('n', '<leader>flr', telescope_builtin.lsp_references,       { desc = 'Telescope Lsp References',      silent = true })
vim.keymap.set('n', '<leader>fL',  ':Telescope luasnip<CR>',               { desc = 'Telescope LuaSnip',             silent = true })
vim.keymap.set('n', '<leader>fm',  telescope_builtin.marks,                { desc = 'Telescope Marks',               silent = true })
--vim.keymap.set('n', '<leader>fo',  telescope_extension.octo_commands.octo_commands,             { desc = 'Telescope Octo Commands',           silent = true })
vim.keymap.set('n', '<leader>fO',  telescope_builtin.oldfiles,             { desc = 'Telescope Old Files',           silent = true })
vim.keymap.set('n', '<leader>fq',  telescope_builtin.quickfix,             { desc = 'Telescope Quickfix',            silent = true })
vim.keymap.set('n', '<leader>fr',  telescope_builtin.registers,            { desc = 'Telescope Registers',           silent = true })
vim.keymap.set('n', '<leader>fR',  ':Telescope rails_related_files<CR>',   { desc = 'Telescope Rails Related Files', silent = true })
vim.keymap.set('n', '<leader>fs',  telescope_builtin.colorscheme,          { desc = 'Telescope Colorscheme',         silent = true  })

-- Default keymaps for git_commits (fGc):
-- `<cr>`: checks out the currently selected commit
-- `<C-r>m`: resets current branch to selected commit using mixed mode
-- `<C-r>s`: resets current branch to selected commit using soft mode
-- `<C-r>h`: resets current branch to selected commit using hard mode

-- Default keymaps or your overridden `select_` keys for git_bcommits (fGb):
-- `<cr>`: checks out the currently selected commit
-- `<c-v>`: opens a diff in a vertical split
-- `<c-x>`: opens a diff in a horizontal split
-- `<c-t>`: opens a diff in a new tab

-- Default keymaps for git_branches (fGB):
-- `<cr>`: checks out the currently selected branch
-- `<C-t>`: tracks currently selected branch
-- `<C-r>`: rebases currently selected branch
-- `<C-a>`: creates a new branch, with confirmation prompt before creation
-- `<C-d>`: deletes the currently selected branch, with confirmation prompt before deletion
-- `<C-y>`: merges the currently selected branch, with confirmation prompt before deletion

