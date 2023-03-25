local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)

  require('lsp_signature').on_attach({
    bind = true,
    handler_opts = {
      border = 'rounded'
    }
  }, bufnr)

  -- keymaps
  vim.keymap.set('n', '<leader>lf',  '<cmd>lua vim.lsp.buf.format { async = true }<CR>', { desc = 'Format Code' })
  vim.keymap.set('n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration<CR>',             { desc = 'Declaration' })
  vim.keymap.set('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>',        { desc = 'Implementation' })
  vim.keymap.set('n', '<leader>lr',  '<cmd>lua vim.lsp.buf.references()<cr>',            { desc = 'References' })
  vim.keymap.set('n', '<leader>lk',  '<cmd>lua vim.lsp.buf.signature_help()<cr>',        { desc = 'Signature Help' })
  vim.keymap.set('n', '<leader>lt',  '<cmd>lua vim.lsp.buf.type_definition()<cr>',       { desc = 'Type Definition' })
  vim.keymap.set('n', '<leader>lgf', '<cmd>Lspsaga lsp_finder<CR>',                      { desc = 'LSP Finder' })
  vim.keymap.set('n', '<leader>lgd', '<cmd>Lspsaga peek_definition()<CR>',               { desc = 'Peek Definition' })
  vim.keymap.set('n', '<leader>lca', '<cmd>Lspsaga code_action<CR>',                     { desc = 'Code Action' })
  vim.keymap.set('n', '<leader>lR',  '<cmd>Lspsaga rename<CR>',                          { desc = 'Rename' })
  vim.keymap.set('n', '<leader>ld',  '<cmd>Lspsaga show_line_diagnostics<CR>',           { desc = 'Show Line Diagnostics' })
  vim.keymap.set('n', '<leader>ld',  '<cmd>Lspsaga show_cursor_diagnostics<CR>',         { desc = 'Show Line Diagnostics' })
  vim.keymap.set('n', '<leader>l[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>',            { desc = 'Jump to Previous diagnostic error' })
  vim.keymap.set('n', '<leader>l]d', '<cmd>Lspsaga diagnostic_jump_next<CR>',            { desc = 'Jump to Next diagnostic error' })
  vim.keymap.set('n', '<leader>lK',  '<cmd>Lspsaga hover-doc<CR>',                       { desc = 'Hover Doc' })
  print('Attached to ' .. client.name)
end)

--Default Navigator keymaps
--mode	key	function
--vim.keymap.set('n',       'gr',            '', { desc = 'async references, definitions and context',                  silent = true })
--vim.keymap.set('n',       '<Leader>gr',    '', { desc = 'show reference and context',                                 silent = true })
--vim.keymap.set('i',       '<m-k>',         '', { desc = 'signature help',                                             silent = true })
--vim.keymap.set('n',       '<c-k>',         '', { desc = 'signature help',                                             silent = true })
--vim.keymap.set('n',       'gW',            '', { desc = 'workspace symbol fuzzy finder',                              silent = true })
--vim.keymap.set('n',       'gD',            '', { desc = 'declaration',                                                silent = true })
--vim.keymap.set('n',       'gd',            '', { desc = 'definition',                                                 silent = true })
--vim.keymap.set('n',       'gt',            '', { desc = 'type definition',                                            silent = true })
--vim.keymap.set('n',       'g0',            '', { desc = 'document symbol',                                            silent = true })
--vim.keymap.set('n',       '<C-]>',         '', { desc = 'go to definition (if multiple show listview)',               silent = true })
--vim.keymap.set('n',       'gp',            '', { desc = 'definition preview (show Preview)',                          silent = true })
--vim.keymap.set('n',       '<C-LeftMouse>', '', { desc = 'definition',                                                 silent = true })
--vim.keymap.set('n',       'g<LeftMouse>',  '', { desc = 'implementation',                                             silent = true })
--vim.keymap.set('n',       '<Leader>gt',    '', { desc = 'treesitter document symbol',                                 silent = true })
--vim.keymap.set('n',       '<Leader>gT',    '', { desc = 'treesitter symbol for all open buffers',                     silent = true })
--vim.keymap.set('n',       '<Leader> ct',   '', { desc = 'ctags symbol search',                                        silent = true })
--vim.keymap.set('n',       '<Leader> cg',   '', { desc = 'ctags symbol generate',                                      silent = true })
--vim.keymap.set('n',       'K',             '', { desc = 'hover doc',                                                  silent = true })
--vim.keymap.set('n',       '<leader>ca',    '', { desc = 'code action (when you see 🏏 )',                             silent = true })
--vim.keymap.set('n',       '<leader>la',    '', { desc = 'code lens action (when you see a codelens indicator)',       silent = true })
--vim.keymap.set('v',       '<leader>ca',    '', { desc = 'range code action (when you see 🏏 )',                       silent = true })
--vim.keymap.set('n',       '<leader>rn',    '', { desc = 'rename with floating window',                                silent = true })
--vim.keymap.set('n',       '<Leader>re',    '', { desc = 'rename (lsp default)',                                       silent = true })
--vim.keymap.set('n',       '<Leader>gi',    '', { desc = 'hierarchy incoming calls',                                   silent = true })
--vim.keymap.set('n',       '<Leader>go',    '', { desc = 'hierarchy outgoing calls',                                   silent = true })
--vim.keymap.set('n',       'gi',            '', { desc = 'implementation',                                             silent = true })
--vim.keymap.set('n',       '<leader> D',    '', { desc = 'type definition',                                            silent = true })
--vim.keymap.set('n',       'gL',            '', { desc = 'show line diagnostic',                                       silent = true })
--vim.keymap.set('n',       'gG',            '', { desc = 'show diagnostic for all buffers',                            silent = true })
--vim.keymap.set('n',       ']d',            '', { desc = 'next diagnostic',                                            silent = true })
--vim.keymap.set('n',       '[d',            '', { desc = 'previous diagnostic',                                        silent = true })
--vim.keymap.set('n',       '<Leader> dt',   '', { desc = 'diagnostic toggle(enable/disable)',                          silent = true })
--vim.keymap.set('n',       ']r',            '', { desc = 'next treesitter reference/usage',                            silent = true })
--vim.keymap.set('n',       '[r',            '', { desc = 'previous treesitter reference/usage',                        silent = true })
--vim.keymap.set('n',       '<leader> wa',   '', { desc = 'add workspace folder',                                       silent = true })
--vim.keymap.set('n',       '<leader> wr',   '', { desc = 'remove workspace folder',                                    silent = true })
--vim.keymap.set('n',       '<leader> wl',   '', { desc = 'print workspace folder',                                     silent = true })
--vim.keymap.set('n',       '<Leader>k',     '', { desc = 'toggle reference highlight',                                 silent = true })
--vim.keymap.set('n',       '<Ctrl-w>j',     '', { desc = 'move cursor to preview (windows move to bottom view point)', silent = true })
--vim.keymap.set('n',       '<Ctrl-w>k',     '', { desc = 'move cursor to list (windows move to up view point)',        silent = true })
--vim.keymap.set('n',       '<C-v>',         '', { desc = 'open preview file in nvim with vsplit',                      silent = true })
--vim.keymap.set('n',       '<C-s>',         '', { desc = 'open preview file in nvim with split',                       silent = true })
--vim.keymap.set('n',       '<Enter>',       '', { desc = 'open preview file in nvim/Apply action',                     silent = true })
--vim.keymap.set('n',       '<ESC>',         '', { desc = 'close listview of floating window',                          silent = true })
--vim.keymap.set('n',       '<C-q>',         '', { desc = 'close listview and send results to quickfix',                silent = true })
--vim.keymap.set({'i','n'}, '<C-o>',         '', { desc = 'open preview file in nvim/Apply action',                     silent = true })
--vim.keymap.set({'i','n'}, '<C-e>',         '', { desc = 'close listview of floating window',                          silent = true })
--vim.keymap.set({'i','n'}, '<C-p>',         '', { desc = 'previous item in list',                                      silent = true })
--vim.keymap.set({'i','n'}, '<C-n>',         '', { desc = 'next item in list',                                          silent = true })
--vim.keymap.set({'i','n'}, '<Up>',          '', { desc = 'previous item in list',                                      silent = true })
--vim.keymap.set({'i','n'}, '<Down>',        '', { desc = 'next item in list',                                          silent = true })
--vim.keymap.set({'i','n'}, '<C-b>',         '', { desc = 'previous page in listview',                                  silent = true })
--vim.keymap.set({'i','n'}, '<C-f>',         '', { desc = 'next page in listview',                                      silent = true })
--vim.keymap.set({'i','n'}, '<C-s>',         '', { desc = 'save the modification to preview window to file',            silent = true })
--vim.keymap.set({'i','n'}, number '1~9',    '', { desc = 'move to ith row/item in the list', silent = true })
