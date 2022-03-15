---[[---------------------------------------]]---
--                 SmithWebDev                 --
--                   Keymaps                   --
---[[---------------------------------------]]---
local u = require'smithwebdev.core.utils'
local noremap = u.noremap
local nnoremap = u.nnoremap
local inoremap = u.inoremap
local tnoremap = u.tnoremap
local vnoremap = u.vnoremap


-- Alternative Standards
----------------------------------------
inoremap('jj', '<Esc>', { desc = 'Exit Insert Mode'})
inoremap('JJ', '<Esc>', { desc = 'Exit Insert Mode'})
nnoremap('H','^', { desc = 'Alternative Begin Line'})
nnoremap('L','$', { desc = 'Alternative End Line'})
nnoremap('Y','y$', { desc = 'Alternative Copy to End of Line'})
nnoremap('<','<<', { desc = 'Alternative Shift Tab (indent)'})
nnoremap('>','>>', { desc = 'Alternative Tab (indent)'})

-- Disable Highlights
----------------------------------------
nnoremap("<leader><CR>", "<cmd>noh<CR>", {desc = 'Disable Highlights'})

-- Resize Window Panes
----------------------------------------
vim.api.nvim_set_keymap('n', '<up>', ':resize +2<CR>', default_opts) --(,             'Resize Window Up)
vim.api.nvim_set_keymap('n', '<down>', ':resize -2<CR>', default_opts) --(,           'Resize Window Down)
vim.api.nvim_set_keymap('n', '<left>', ':vertical resize +2<CR>', default_opts) --(,  'Resize Window Left)
vim.api.nvim_set_keymap('n', '<right>', ':vertical resize -2<CR>', default_opts) --(, 'Resize Window Right)

-- Rotate Window Panes
----------------------------------------
vim.api.nvim_set_keymap('n', '<leader>H', '<C-w>H', default_opts) --(,                'Move Pane Left')
vim.api.nvim_set_keymap('n', '<leader>J', '<C-w>J', default_opts) --(,                'Move Pane Down')
vim.api.nvim_set_keymap('n', '<leader>K', '<C-w>K', default_opts) --(,                'Move Pane Up')
vim.api.nvim_set_keymap('n', '<leader>L', '<C-w>L', default_opts) --(,                'Move Pane Right')

-- Tabs
----------------------------------------
vim.api.nvim_set_keymap('n', '<leader>tc', ':tabc<CR>', default_opts) --(,            'Close Tab')
vim.api.nvim_set_keymap('n', '<leader>te', ':tabedit %<CR>', default_opts) --(,       'Edit File in Tab')
vim.api.nvim_set_keymap('n', '<leader>th', ':tabfirst<CR>', default_opts) --(,        'Goto Tab First')
vim.api.nvim_set_keymap('n', '<leader>tj', ':tabN<CR>', default_opts) --(,            'Goto Tab Last')
vim.api.nvim_set_keymap('n', '<leader>tk', ':tabp<CR>', default_opts) --(,            'Goto Tab Last')
vim.api.nvim_set_keymap('n', '<leader>tl', ':tablast<CR>', default_opts) --(,         'Goto Tab Last')
vim.api.nvim_set_keymap('n', '<leader>tn', ':tabnew<Space>', default_opts) --(,       'Goto Tab New')
vim.api.nvim_set_keymap('n', '<leader>to', '<C-w>T', default_opts) --(,               'Open File In New Tab')
vim.api.nvim_set_keymap('n', '<leader>tt', ':tabs', default_opts) --(,                'Show Tab List')

-- Window Navigation
----------------------------------------
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', default_opts) --(,                    'Navigate Left')
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', default_opts) --(,                    'Navigate Down')
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', default_opts) --(,                    'Navigate Up')
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', default_opts) --(,                    'Navigate Right')

-- Window Resize
----------------------------------------
vim.api.nvim_set_keymap('n', 'M', '<C-w>|<C-w>_', default_opts) --(,                  'Window Resize Max')
vim.api.nvim_set_keymap('n', '<leader>=', '<C-w>=', default_opts) --(,                'Window Resize Equally')
vim.api.nvim_set_keymap('n', '<leader>|', '<C-w>|', default_opts) --(,                'Window Resize Max Vertically')
vim.api.nvim_set_keymap('n', '<leader>_', '<C-w>_', default_opts) --(,                'Window Resize Max Horizontally')
vim.api.nvim_set_keymap('n', '<leader>\\', '<C-w>v', default_opts) --(,               'Window Split Vertically')
vim.api.nvim_set_keymap('n', '<leader>-', '<C-w>s', default_opts) --(,                'Window Split Horizonatally')

vim.api.nvim_set_keymap('n', '<leader>q', '<C-w>q', default_opts) --(,                'Window Close')
vim.api.nvim_set_keymap('n', '<leader>Q', '<cmd>qa!<CR>', default_opts) --(,          'Window Close')
-- Better movement between windows
nnoremap("<C-h>", "<C-w><C-h>", { desc = "Go to the left window" })
nnoremap("<C-l>", "<C-w><C-l>", { desc = "Go to the right window" })
nnoremap("<C-j>", "<C-w><C-j>", { desc = "Go to the bottom window" })
nnoremap("<C-k>", "<C-w><C-k>", { desc = "Go to the top window" })


--vim.api.nvim_set_keymap('i', 'jj', '<Esc>', default_opts) --(,                        'Exit Insert Mode')
