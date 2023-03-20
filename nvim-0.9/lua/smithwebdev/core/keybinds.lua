---[[---------------------------------------]]---
--                 SmithWebDev                 --
--                   Keymaps                   --
---[[---------------------------------------]]---

--[[ Map Leader ]]--------------------------------------------------------------
vim.g.mapleader = " "

--[[ Alternative Standards ]]---------------------------------------------------
vim.keymap.set("i", 'jj',                   '<Esc>',                        { desc = 'Exit Insert Mode', silent = true  })
vim.keymap.set("i", 'JJ',                   '<Esc>',                        { desc = 'Exit Insert Mode', silent = true  })
vim.keymap.set("n", 'H',                    '^',                            { desc = 'Alternative Begin Line', silent = true  })
vim.keymap.set("n", 'J',                    'mzJ`z',                        { desc = 'Maintains cursor when joining lines', silent = true })
vim.keymap.set("n", 'L',                    '$',                            { desc = 'Alternative End Line', silent = true  })
vim.keymap.set("n", 'Y',                    'y$',                           { desc = 'Alternative Copy to End of Line', silent = true  })
vim.keymap.set("i", '<C-l>',                '<Esc>$a',                      { desc = 'Jump to end of line while in Insert Mode', silent = true  })
vim.keymap.set("n", '<',                    '<gv',                          { desc = 'Alternative Shift Tab (indent)', silent = true  })
vim.keymap.set("n", '>',                    '>gv',                          { desc = 'Alternative Tab (indent)', silent = true  })
vim.keymap.set("n", '<leader>b',            ':b<Space>',                    { desc = 'Switch to buffer', silent = true  })
vim.keymap.set("n", '<leader>ls',           ':ls<CR>',                      { desc = 'List open files', silent = true  })
vim.keymap.set("n", '<leader>w',            ':w<CR>',                       { desc = 'Save shortcut', silent = true  })
vim.keymap.set("n", '<leader>W',            ':wall<CR>',                    { desc = 'Save all shortcut', silent = true  })
vim.keymap.set('n', 'vv',                   'viw',                          { desc = 'Select word under cursor', silent = true })

vim.keymap.set("n", '<leader>nw',           ':set nowrap<CR>',              { desc = 'Set No Wrap', silent = true  })                                     --  Create a toggle for this setting adjustment --
vim.keymap.set("n", '<leader>nr',           ':set nornu<CR>',               { desc = 'Set No Relative Number', silent = true  })                          --  Create a toggle for this setting adjustment --


vim.keymap.set('x', '<leader>p',            "\"_dP",                        {desc = 'Maintain registered info when pasting', silent = true } )

vim.keymap.set('n', '<leader>d',            "\"_d",                         {desc = '', silent = true })
vim.keymap.set('v', '<leader>d',            "\"_d",                         {desc = '', silent = true })

vim.keymap.set('n', '<leader>y',            "\"+y",                         {desc = 'Yank text to System Clipboard', silent = true })
vim.keymap.set('v', '<leader>y',            "\"+y",                         {desc = 'Yank text to System Clipboard', silent = true })
vim.keymap.set('n', '<leader>Y',            "\"+Y",                         {desc = 'Yank text to System Clipboard', silent = true })
vim.keymap.set('v', '<leader>Y',            "\"+Y",                         {desc = 'Yank text to System Clipboard', silent = true })
vim.keymap.set('n', '==',                   'gg=G<c-o>',                    {desc = 'Easy indent return cursor to previous line', silent = true })

--[[ Change Colorscheme ]]------------------------------------------------------
--vim.keymap.set("n",  '<',                    '',                                                        { desc = '', silent = true })

--[[ Disable Highlights ]]------------------------------------------------------
vim.keymap.set("n", '<leader><CR>',         ':noh<CR>',                     { desc = 'Disable Highlights', silent = true  })

--[[ Move Lines ]]--------------------------------------------------------------
vim.keymap.set("v", 'J',                    ":m '>+1<CR>gv=gv",             { desc = 'Move Lines Down', silent = true })
vim.keymap.set("v", 'K',                    ":m '<-2<CR>gv=gv",             { desc = 'Move Lines Up', silent = true })


--[[ Quickfix bindings ]]-------------------------------------------------------
vim.keymap.set("n", '<leader>cj',           '<cmd>cnext<CR>zz',             { desc = '', silent = true  })
vim.keymap.set("n", '<leader>cJ',           '<cmd>cprev<CR>zz',             { desc = '', silent = true  })
vim.keymap.set("n", '<leader>lj',           '<cmd>lnext<CR>zz',             { desc = '', silent = true  })
vim.keymap.set("n", '<leader>lJ',           '<cmd>lprev<CR>zz',             { desc = '', silent = true  })

--[[ Resize Window Panes ]]-----------------------------------------------------
--vim.keymap.set("n", '<up>',                 ':resize -2<CR>',                { desc = 'Resize Window Up', silent = true  })
--vim.keymap.set("n", '<down>',               ':resize +2<CR>',                { desc = 'Resize Window Down', silent = true  })
--vim.keymap.set("n", '<left>',               ':vertical resize -2<CR>',       { desc = 'Resize Window Left', silent = true  })
--vim.keymap.set("n", '<right>',              ':vertical resize +2<CR>',       { desc = 'Resize Window Right', silent = true  })

--[[ Rotate Window Panes ]]-----------------------------------------------------
vim.keymap.set("n", '<leader>H',            '<C-w>H',                       { desc = 'Move Pane Left', silent = true  })
vim.keymap.set("n", '<leader>J',            '<C-w>J',                       { desc = 'Move Pane Down', silent = true  })
vim.keymap.set("n", '<leader>K',            '<C-w>K',                       { desc = 'Move Pane Up', silent = true  })
vim.keymap.set("n", '<leader>L',            '<C-w>L',                       { desc = 'Move Pane Right', silent = true  })

--[[ Source file ]]-------------------------------------------------------------
vim.keymap.set("n", '<leader><leader>so',   ':so %<CR>',                    { desc = 'Source current file', silent = true })

--[[ Tabs ]]--------------------------------------------------------------------
vim.keymap.set("n", '<Tab>tc',              ':tabc<CR>',                    { desc = 'Close Tab', silent = true  })
vim.keymap.set("n", '<Tab>te',              ':tabedit %<CR>',               { desc = 'Edit File in Tab', silent = true  })
vim.keymap.set("n", '<Tab>th',              ':tabfirst<CR>',                { desc = 'Goto Tab First', silent = true  })
vim.keymap.set("n", '<Tab>tJ',              ':tabn<Space>',                 { desc = 'Goto Tab Next', silent = true  })
vim.keymap.set("n", '<Tab>tj',              ':tabn<Space><CR>',             { desc = 'Goto Tab Next', silent = true  })
vim.keymap.set("n", '<Tab>tK',              ':tabp<Space>',                 { desc = 'Goto Tab Previous', silent = true  })
vim.keymap.set("n", '<Tab>tk',              ':tabp<Space><CR>',             { desc = 'Goto Tab Previous', silent = true  })
vim.keymap.set("n", '<Tab>tl',              ':tablast<CR>',                 { desc = 'Goto Tab Last', silent = true  })
vim.keymap.set("n", '<Tab>tN',              ':tabnew<Space>',               { desc = 'Goto Tab New', silent = true  })
vim.keymap.set("n", '<Tab>tn',              ':tabnew<Space><CR>',           { desc = 'Goto Tab New', silent = true  })
vim.keymap.set("n", '<Tab>to',              '<C-w>T',                       { desc = 'Open File In New Tab', silent = true  })
vim.keymap.set("n", '<Tab>t%',              '<C-w>T',                       { desc = 'Open File In New Tab', silent = true  })
vim.keymap.set("n", '<Tab>tt',              ':tabs',                        { desc = 'Show Tab List', silent = true  })

--[[ Window Navigation ]]-------------------------------------------------------
vim.keymap.set("n", '<C-h>',                '<C-w>h',                       { desc = 'Navigate Left', silent = true  })
vim.keymap.set("n", '<C-j>',                '<C-w>j',                       { desc = 'Navigate Down', silent = true  })
vim.keymap.set("n", '<C-k>',                '<C-w>k',                       { desc = 'Navigate Up', silent = true  })
vim.keymap.set("n", '<C-l>',                '<C-w>l',                       { desc = 'Navigate Right', silent = true  })

--[[ Window Resize ]]-----------------------------------------------------------
vim.keymap.set("n", 'M',                    '<C-w>|<C-w>_',                 { desc = 'Window Resize Max', silent = true  })
vim.keymap.set("n", '<leader>=',            '<C-w>=',                       { desc = 'Window Resize Equally', silent = true  })
vim.keymap.set("n", '<leader>|',            '<C-w>|',                       { desc = 'Window Resize Max Vertically', silent = true  })
vim.keymap.set("n", '<leader>_',            '<C-w>_',                       { desc = 'Window Resize Max Horizontally', silent = true  })
vim.keymap.set("n", '<leader>\\',           '<C-w>v',                       { desc = 'Window Split Vertically', silent = true  })
vim.keymap.set("n", '<leader>-',            '<C-w>s',                       { desc = 'Window Split Horizonatally', silent = true  })
vim.keymap.set("n", '<leader>q',            '<C-w>q',                       { desc = 'Window Close', silent = true  })
vim.keymap.set("n", '<leader>Q',            ':qa!<CR>',                     { desc = 'Window Close', silent = true  })

--[[ Better movement between windows ]]-----------------------------------------
vim.keymap.set("n", '<C-h>',                '<C-w><C-h>',                   { desc = 'Go to the left window', silent = true  })
vim.keymap.set("n", '<C-l>',                '<C-w><C-l>',                   { desc = 'Go to the right window', silent = true  })
vim.keymap.set("n", '<C-j>',                '<C-w><C-j>',                   { desc = 'Go to the bottom window', silent = true  })
vim.keymap.set("n", '<C-k>',                '<C-w><C-k>',                   { desc = 'Go to the top window', silent = true  })

--[[ Alternative file explorer ]]-----------------------------------------------
vim.keymap.set("n", '<leader><leader>e',    ':Lex 30<CR>',                  { desc = 'Open File Explorer to the left', silent = true  })

--[[ Highly Used CLI commands ]]------------------------------------------------
vim.keymap.set("n", '<leader><leader>cya',  ':!yarn add<Space>',            { desc = 'Yarn add command', silent = true  })
vim.keymap.set("n", '<leader><leader>cyla', ':!yarn lint<CR>',              { desc = 'Yarn lint command (all filetypes)', silent = true  })
vim.keymap.set("n", '<leader><leader>cylj', ':!yarn lint:js --fix<CR>',     { desc = 'Yarn lint command (JS file)', silent = true  })
vim.keymap.set("n", '<leader><leader>cyr',  ':!yarn remove<Space>',         { desc = 'Yarn remove command', silent = true  })
vim.keymap.set("n", '<leader><leader>ct',   ':!touch<Space>',               { desc = 'Touch cli command', silent = true  })



--[[---------------------------------------]]---
--                 SmithWebDev                --
--                   Macros                   --
--[[---------------------------------------]]---
vim.keymap.set("c", '<leader>mh',           "PF/;lYHi'', -- HkbjjHpV>", { desc = "macro: reduces url to 'github_user/github_repo', silent = true  format"})

