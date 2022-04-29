---[[---------------------------------------]]---
--                 SmithWebDev                 --
--                   Keymaps                   --
---[[---------------------------------------]]---
local u        = require'smithwebdev.core.utils'
local nnoremap = u.nnoremap
local inoremap = u.inoremap
local vnoremap = u.vnoremap

-- Map Leader
--------------------------------------------------------------------------------
vim.g.mapleader = " "

-- Alternative Standards
--------------------------------------------------------------------------------
inoremap('jj',                  '<Esc>',                         { desc = 'Exit Insert Mode'})
inoremap('JJ',                  '<Esc>',                         { desc = 'Exit Insert Mode'})
nnoremap('H',                   '^',                             { desc = 'Alternative Begin Line'})
nnoremap('L',                   '$',                             { desc = 'Alternative End Line'})
nnoremap('Y',                   'y$',                            { desc = 'Alternative Copy to End of Line'})
inoremap('<C-l>',               '<Esc>$a',                       { desc = 'Jump to end of line while in Insert Mode'})
nnoremap('<',                   '<<',                            { desc = 'Alternative Shift Tab (indent)'})
nnoremap('>',                   '>>',                            { desc = 'Alternative Tab (indent)'})
--vnoremap('p',                   '_dP',                           { desc = 'Maintain registered info when pasting'})
nnoremap('<leader>b',           ':b<Space>',                     { desc = 'Switch to buffer'})
nnoremap('<leader>ls',          ':ls<CR>',                       { desc = 'List open files'})
nnoremap('<leader>w',           ':w<CR>',                        { desc = 'Save shortcut'})
nnoremap('<leader>W',           ':wall<CR>',                     { desc = 'Save all shortcut'})

nnoremap('<leader>nw',           ':set nowrap<CR>',              { desc = 'Set No Wrap'})

-- Disable Highlights
--------------------------------------------------------------------------------
nnoremap('<leader><CR>',        ':noh<CR>',                      { desc = 'Disable Highlights'})

-- Resize Window Panes
--------------------------------------------------------------------------------
nnoremap('<up>',                ':resize +2<CR>',                { desc = 'Resize Window Up'})
nnoremap('<down>',              ':resize -2<CR>',                { desc = 'Resize Window Down'})
nnoremap('<left>',              ':vertical resize +2<CR>',       { desc = 'Resize Window Left'})
nnoremap('<right>',             ':vertical resize -2<CR>',       { desc = 'Resize Window Right'})

-- Rotate Window Panes
--------------------------------------------------------------------------------
nnoremap('<leader>H',           '<C-w>H',                        { desc = 'Move Pane Left'})
nnoremap('<leader>J',           '<C-w>J',                        { desc = 'Move Pane Down'})
nnoremap('<leader>K',           '<C-w>K',                        { desc = 'Move Pane Up'})
nnoremap('<leader>L',           '<C-w>L',                        { desc = 'Move Pane Right'})

-- Tabs
--------------------------------------------------------------------------------
nnoremap('<leader>tc',          ':tabc<CR>',                     { desc = 'Close Tab'})
nnoremap('<leader>te',          ':tabedit %<CR>',                { desc = 'Edit File in Tab'})
nnoremap('<leader>th',          ':tabfirst<CR>',                 { desc = 'Goto Tab First'})
nnoremap('<leader>tj',          ':tabn<Space>',                  { desc = 'Goto Tab Next'})
nnoremap('<leader>tk',          ':tabp<Space>',                  { desc = 'Goto Tab Previous'})
nnoremap('<leader>tl',          ':tablast<CR>',                  { desc = 'Goto Tab Last'})
nnoremap('<leader>tn',          ':tabnew<Space>',                { desc = 'Goto Tab New'})
nnoremap('<leader>to',          '<C-w>T',                        { desc = 'Open File In New Tab'})
nnoremap('<leader>tt',          ':tabs',                         { desc = 'Show Tab List'})

-- Window Navigation
--------------------------------------------------------------------------------
nnoremap('<C-h>',               '<C-w>h',                        { desc = 'Navigate Left'})
nnoremap('<C-j>',               '<C-w>j',                        { desc = 'Navigate Down'})
nnoremap('<C-k>',               '<C-w>k',                        { desc = 'Navigate Up'})
nnoremap('<C-l>',               '<C-w>l',                        { desc = 'Navigate Right'})

-- Window Resize
--------------------------------------------------------------------------------
nnoremap('M',                   '<C-w>|<C-w>_',                  { desc = 'Window Resize Max'})
nnoremap('<leader>=',           '<C-w>=',                        { desc = 'Window Resize Equally'})
nnoremap('<leader>|',           '<C-w>|',                        { desc = 'Window Resize Max Vertically'})
nnoremap('<leader>_',           '<C-w>_',                        { desc = 'Window Resize Max Horizontally'})
nnoremap('<leader>\\',          '<C-w>v',                        { desc = 'Window Split Vertically'})
nnoremap('<leader>-',           '<C-w>s',                        { desc = 'Window Split Horizonatally'})
nnoremap('<leader>q',           '<C-w>q',                        { desc = 'Window Close'})
nnoremap('<leader>Q',           ':qa!<CR>',                      { desc = 'Window Close'})

-- Better movement between windows
--------------------------------------------------------------------------------
nnoremap('<C-h>',               '<C-w><C-h>',                    { desc = 'Go to the left window' })
nnoremap('<C-l>',               '<C-w><C-l>',                    { desc = 'Go to the right window' })
nnoremap('<C-j>',               '<C-w><C-j>',                    { desc = 'Go to the bottom window' })
nnoremap('<C-k>',               '<C-w><C-k>',                    { desc = 'Go to the top window' })

-- Alternative file explorer
--------------------------------------------------------------------------------
nnoremap('<leader><leader>e',   ':Lex 30<CR>',                   { desc = 'Open File Explorer to the left'})

-- Highly Used CLI commands
--------------------------------------------------------------------------------
nnoremap('<leader><leader>cya', ':!yarn add<Space>',             { desc = 'Yarn add command'})
nnoremap('<leader><leader>ct',  ':!touch<Space>',                { desc = 'Touch cli command'})

--vim.api.nvim_set_keymap('i',  '<c-l>', ':lua EscapePair()<CR>', default_opts)
nnoremap('<leader><leader>ht',  ':helptags $VIMRUNTIME/doc<CR>', { desc = 'Connect VIM/Neovim help docs to editor paths' })





---[[---------------------------------------]]---
--                 SmithWebDev                 --
--                   Macros                    --
---[[---------------------------------------]]---

