---[[---------------------------------------]]---
--                 SmithWebDev                 --
--                   Keymaps                   --
---[[---------------------------------------]]---

-- Map Leader
--------------------------------------------------------------------------------
vim.g.mapleader = " "

-- Alternative Standards
--------------------------------------------------------------------------------
vim.keymap.set("i", 'jj',                   '<Esc>',                         { desc = 'Exit Insert Mode' })
vim.keymap.set("i", 'JJ',                   '<Esc>',                         { desc = 'Exit Insert Mode' })
vim.keymap.set("n", 'H',                    '^',                             { desc = 'Alternative Begin Line' })
vim.keymap.set("n", 'J',                    'mzJ`z',                         { desc = 'Maintains cursor when joining lines'})
vim.keymap.set("n", 'L',                    '$',                             { desc = 'Alternative End Line' })
vim.keymap.set("n", 'Y',                    'y$',                            { desc = 'Alternative Copy to End of Line' })
vim.keymap.set("i", '<C-l>',                '<Esc>$a',                       { desc = 'Jump to end of line while in Insert Mode' })
vim.keymap.set("n", '<',                    '<gv',                           { desc = 'Alternative Shift Tab (indent)' })
vim.keymap.set("n", '>',                    '>gv',                           { desc = 'Alternative Tab (indent)' })
vim.keymap.set("n", '<leader>b',            ':b<Space>',                     { desc = 'Switch to buffer' })
vim.keymap.set("n", '<leader>ls',           ':ls<CR>',                       { desc = 'List open files' })
vim.keymap.set("n", '<leader>w',            ':w<CR>',                        { desc = 'Save shortcut' })
vim.keymap.set("n", '<leader>W',            ':wall<CR>',                     { desc = 'Save all shortcut' })

vim.keymap.set("n", '<leader>nw',           ':set nowrap<CR>',               { desc = 'Set No Wrap' })                                     --  Create a toggle for this setting adjustment
vim.keymap.set("n", '<leader>nr',           ':set nornu<CR>',                { desc = 'Set No Relative Number' })                          --  Create a toggle for this setting adjustment


vim.keymap.set('x', '<leader>p',            "\"_dP",                         {desc = 'Maintain registered info when pasting'} )

vim.keymap.set('n', '<leader>d',            "\"_d",                          {desc = ''})
vim.keymap.set('v', '<leader>d',            "\"_d",                          {desc = ''})

vim.keymap.set('n', '<leader>y',            "\"+y",                          {desc = 'Yank text to System Clipboard'})
vim.keymap.set('v', '<leader>y',            "\"+y",                          {desc = 'Yank text to System Clipboard'})
vim.keymap.set('n', '<leader>Y',            "\"+Y",                          {desc = 'Yank text to System Clipboard'})
vim.keymap.set('v', '<leader>Y',            "\"+Y",                          {desc = 'Yank text to System Clipboard'})


-- Change Colorscheme
--------------------------------------------------------------------------------
--vim.keymap.set("n",  '<',                    '',                                                        { desc = ''})

-- Disable Highlights
--------------------------------------------------------------------------------
vim.keymap.set("n", '<leader><CR>',         ':noh<CR>',                      { desc = 'Disable Highlights' })

-- Move Lines
--------------------------------------------------------------------------------
vim.keymap.set("v", 'J',                    ":m '>+1<CR>gv=gv",              { desc = 'Move Lines Down'})
vim.keymap.set("v", 'K',                    ":m '<-2<CR>gv=gv",              { desc = 'Move Lines Up'})


-- Quickfix bindings
--------------------------------------------------------------------------------
vim.keymap.set("n",  '<leader>cj',               '<cmd>cnext<CR>zz',                                          { desc = '' })
vim.keymap.set("n",  '<leader>cJ',               '<cmd>cprev<CR>zz',                                          { desc = '' })
vim.keymap.set("n",  '<leader>lj',               '<cmd>lnext<CR>zz',                                          { desc = '' })
vim.keymap.set("n",  '<leader>lJ',               '<cmd>lprev<CR>zz',                                          { desc = '' })

-- Resize Window Panes
--------------------------------------------------------------------------------
vim.keymap.set("n", '<up>',                 ':resize -2<CR>',                { desc = 'Resize Window Up' })
vim.keymap.set("n", '<down>',               ':resize +2<CR>',                { desc = 'Resize Window Down' })
vim.keymap.set("n", '<left>',               ':vertical resize -2<CR>',       { desc = 'Resize Window Left' })
vim.keymap.set("n", '<right>',              ':vertical resize +2<CR>',       { desc = 'Resize Window Right' })

-- Rotate Window Panes
--------------------------------------------------------------------------------
vim.keymap.set("n", '<leader>H',            '<C-w>H',                        { desc = 'Move Pane Left' })
vim.keymap.set("n", '<leader>J',            '<C-w>J',                        { desc = 'Move Pane Down' })
vim.keymap.set("n", '<leader>K',            '<C-w>K',                        { desc = 'Move Pane Up' })
vim.keymap.set("n", '<leader>L',            '<C-w>L',                        { desc = 'Move Pane Right' })

-- Source file
--------------------------------------------------------------------------------
vim.keymap.set("n", '<leader><leader>so',   ':so %<CR>',                     { desc = 'Source current file'})

-- Tabs
--------------------------------------------------------------------------------
vim.keymap.set("n", '<leader>tc',           ':tabc<CR>',                     { desc = 'Close Tab' })
vim.keymap.set("n", '<leader>te',           ':tabedit %<CR>',                { desc = 'Edit File in Tab' })
vim.keymap.set("n", '<leader>th',           ':tabfirst<CR>',                 { desc = 'Goto Tab First' })
vim.keymap.set("n", '<leader>tJ',           ':tabn<Space>',                  { desc = 'Goto Tab Next' })
vim.keymap.set("n", '<leader>tj',           ':tabn<Space><CR>',              { desc = 'Goto Tab Next' })
vim.keymap.set("n", '<leader>tK',           ':tabp<Space>',                  { desc = 'Goto Tab Previous' })
vim.keymap.set("n", '<leader>tk',           ':tabp<Space><CR>',              { desc = 'Goto Tab Previous' })
vim.keymap.set("n", '<leader>tl',           ':tablast<CR>',                  { desc = 'Goto Tab Last' })
vim.keymap.set("n", '<leader>tN',           ':tabnew<Space>',                { desc = 'Goto Tab New' })
vim.keymap.set("n", '<leader>tn',           ':tabnew<Space><CR>',            { desc = 'Goto Tab New' })
vim.keymap.set("n", '<leader>to',           '<C-w>T',                        { desc = 'Open File In New Tab' })
vim.keymap.set("n", '<leader>t%',           '<C-w>T',                        { desc = 'Open File In New Tab' })
vim.keymap.set("n", '<leader>tt',           ':tabs',                         { desc = 'Show Tab List' })

-- Window Navigation
--------------------------------------------------------------------------------
vim.keymap.set("n", '<C-h>',                '<C-w>h',                        { desc = 'Navigate Left' })
vim.keymap.set("n", '<C-j>',                '<C-w>j',                        { desc = 'Navigate Down' })
vim.keymap.set("n", '<C-k>',                '<C-w>k',                        { desc = 'Navigate Up' })
vim.keymap.set("n", '<C-l>',                '<C-w>l',                        { desc = 'Navigate Right' })

-- Window Resize
--------------------------------------------------------------------------------
vim.keymap.set("n", 'M',                    '<C-w>|<C-w>_',                  { desc = 'Window Resize Max' })
vim.keymap.set("n", '<leader>=',            '<C-w>=',                        { desc = 'Window Resize Equally' })
vim.keymap.set("n", '<leader>|',            '<C-w>|',                        { desc = 'Window Resize Max Vertically' })
vim.keymap.set("n", '<leader>_',            '<C-w>_',                        { desc = 'Window Resize Max Horizontally' })
vim.keymap.set("n", '<leader>\\',           '<C-w>v',                        { desc = 'Window Split Vertically' })
vim.keymap.set("n", '<leader>-',            '<C-w>s',                        { desc = 'Window Split Horizonatally' })
vim.keymap.set("n", '<leader>q',            '<C-w>q',                        { desc = 'Window Close' })
vim.keymap.set("n", '<leader>Q',            ':qa!<CR>',                      { desc = 'Window Close' })

-- Better movement between windows
--------------------------------------------------------------------------------
vim.keymap.set("n", '<C-h>',                '<C-w><C-h>',                    { desc = 'Go to the left window' })
vim.keymap.set("n", '<C-l>',                '<C-w><C-l>',                    { desc = 'Go to the right window' })
vim.keymap.set("n", '<C-j>',                '<C-w><C-j>',                    { desc = 'Go to the bottom window' })
vim.keymap.set("n", '<C-k>',                '<C-w><C-k>',                    { desc = 'Go to the top window' })

-- Alternative file explorer
--------------------------------------------------------------------------------
vim.keymap.set("n", '<leader><leader>e',    ':Lex 30<CR>',                   { desc = 'Open File Explorer to the left' })

-- Highly Used CLI commands
--------------------------------------------------------------------------------
vim.keymap.set("n", '<leader><leader>cya',  ':!yarn add<Space>',             { desc = 'Yarn add command' })
vim.keymap.set("n", '<leader><leader>cyla', ':!yarn lint<CR>',               { desc = 'Yarn lint command (all filetypes)' })
vim.keymap.set("n", '<leader><leader>cylj', ':!yarn lint:js --fix<CR>',      { desc = 'Yarn lint command (JS file)' })
vim.keymap.set("n", '<leader><leader>cyr',  ':!yarn remove<Space>',          { desc = 'Yarn remove command' })
vim.keymap.set("n", '<leader><leader>ct',   ':!touch<Space>',                { desc = 'Touch cli command' })

--vim.api.nvim_set_keymap('i',   '<c-l>', ':lua EscapePair()<CR>', default_opts)
vim.keymap.set("n", '<leader><leader>ht',   ':helptags $VIMRUNTIME/doc<CR>', { desc = 'Connect VIM/Neovim help docs to editor paths' })




--[[---------------------------------------]]---
--                 SmithWebDev                --
--                   Macros                   --
--[[---------------------------------------]]---
vim.keymap.set("c", '<leader>mh',           "PF/;lYHi'', -- H�kbjjHpV>",  { desc = "macro: reduces url to 'github_user/github_repo' format"})
