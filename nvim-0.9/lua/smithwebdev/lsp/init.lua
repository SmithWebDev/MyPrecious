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
  vim.keymap.set('n', '<leader>lrn', '<cmd>Lspsaga rename<CR>',                          { desc = 'Rename' })
  vim.keymap.set('n', '<leader>ld',  '<cmd>Lspsaga show_line_diagnostics<CR>',           { desc = 'Show Line Diagnostics' })
  vim.keymap.set('n', '<leader>ld',  '<cmd>Lspsaga show_cursor_diagnostics<CR>',         { desc = 'Show Line Diagnostics' })
  vim.keymap.set('n', '<leader>l[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>',            { desc = 'Jump to Previous diagnostic error' })
  vim.keymap.set('n', '<leader>l]d', '<cmd>Lspsaga diagnostic_jump_next<CR>',            { desc = 'Jump to Next diagnostic error' })
  vim.keymap.set('n', '<leader>lK',  '<cmd>Lspsaga hover-doc<CR>',                       { desc = 'Hover Doc' })
  print('Attached to ' .. client.name)
end)

--Default Navigator keymaps
--mode	key	function
--n,   gr,            async references, definitions and context
--n,   <Leader>gr,    show reference and context
--i,   <m-k>,         signature help
--n,   <c-k>,         signature help
--n,   gW,            workspace symbol fuzzy finder
--n,   gD,            declaration
--n,   gd,            definition
--n,   gt,            type definition
--n,   g0,            document symbol
--n,   <C-]>,         go to definition (if multiple show listview)
--n,   gp,            definition preview (show Preview)
--n,   <C-LeftMouse>, definition
--n,   g<LeftMouse>,  implementation
--n,   <Leader>gt,    treesitter document symbol
--n,   <Leader>gT,    treesitter symbol for all open buffers
--n,   <Leader> ct,   ctags symbol search
--n,   <Leader> cg,   ctags symbol generate
--n,   K,             hover doc
--n,   <leader>ca,     code action (when you see 🏏 )
--n,   <leader>la,     code lens action (when you see a codelens indicator)
--v,   <leader>ca,     range code action (when you see 🏏 )
--n,   <leader>rn,     rename with floating window
--n,   <Leader>re,    rename (lsp default)
--n,   <Leader>gi,    hierarchy incoming calls
--n,   <Leader>go,    hierarchy outgoing calls
--n,   gi,            implementation
--n,   <leader> D,     type definition
--n,   gL,            show line diagnostic
--n,   gG,            show diagnostic for all buffers
--n,   ]d,            next diagnostic
--n,   [d,            previous diagnostic
--n,   <Leader> dt,   diagnostic toggle(enable/disable)
--n,   ]r,            next treesitter reference/usage
--n,   [r,            previous treesitter reference/usage
--n,   <leader> wa,    add workspace folder
--n,   <leader> wr,    remove workspace folder
--n,   <leader> wl,    print workspace folder
--n,   <Leader>k,     toggle reference highlight
--i/n, <C-p>,         previous item in list
--i/n, <C-n>,         next item in list
--i/n, number 1~9,    move to ith row/item in the list
--i/n, <Up>,          previous item in list
--i/n, <Down>,        next item in list
--n,   <Ctrl-w>j,     move cursor to preview (windows move to bottom view point)
--n,   <Ctrl-w>k,     move cursor to list (windows move to up view point)
--i/n, <C-o>,         open preview file in nvim/Apply action
--n,   <C-v>,         open preview file in nvim with vsplit
--n,   <C-s>,         open preview file in nvim with split
--n,   <Enter>,       open preview file in nvim/Apply action
--n,   <ESC>,         close listview of floating window
--i/n, <C-e>,         close listview of floating window
--n,   <C-q>,         close listview and send results to quickfix
--i/n, <C-b>,         previous page in listview
--i/n, <C-f>,         next page in listview
--i/n, <C-s>,         save the modification to preview window to file
