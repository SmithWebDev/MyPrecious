local M = {}

M.plugin = {
  'ray-x/navigator.lua', -- https://github.com/ray-x/navigator.lua

  requires = {
    { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
    'neovim/nvim-lspconfig',
    'ray-x/lsp_signature.nvim',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },

  config = function()
    require 'mason'.setup()
    require 'mason-lspconfig'.setup()
    require 'navigator'.setup({
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- border style, can be one of 'none', 'single', 'double',
      debug = false, -- log output, set to true and log path: ~/.cache/nvim/gh.log
      default_mapping = false,
      --icons = {
      --  -- Code action
      --  code_action_icon = "🏏", -- note: need terminal support, for those not support unicode, might crash
      --  -- Diagnostics
      --  diagnostic_head = '🐛',
      --  diagnostic_head_severity_1 = "🈲",
      --  -- refer to lua/navigator.lua for more icons setups
      --},
      lsp = {
        code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
        code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
        document_highlight = true, -- LSP reference highlight,
        format_on_save = true, -- {true|false} set to false to disasble lsp code format on save (if you are using prettier/efm/formater etc)
        format_options = { async = false }, -- async: disable by default, the option used in vim.lsp.buf.format({async={true|false}, name = 'xxx'})

        diagnostic = {
          underline = true,
          virtual_text = true, -- show virtual for diagnostic message
          update_in_insert = false, -- update diagnostic message in insert mode
        },

        diagnostic_scrollbar_sign = { '▃', '▆', '█' }, -- experimental:  diagnostic status in scroll bar area; set to false to disable the diagnostic sign,
        diagnostic_virtual_text = true, -- show virtual for diagnostic message
        diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
        disply_diagnostic_qf = true, -- always show quickfix if there are diagnostic errors, set to false if you  want to ignore it
        --tsserver = {
        --  filetypes = {'typescript'} -- disable javascript etc,
        --  -- set to {} to disable the lspclient for all filetypes
        --},
        ctags = {
          cmd = 'ctags',
          tagfile = 'tags',
          options = '-R --exclude=.git --exclude=node_modules --exclude=test --exclude=vendor --excmd=number',
        },
      },
      lsp_signature_help = true,
      mason = true,
      --on_attach = function(client, bufnr)
      --  print("Attached to " .. client.name)

      --  local nnoremap = require("smithwebdev.core.utils").nnoremap

      --  nnoremap(
      --    "<leader>ll",
      --    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
      --    { desc = "List Workspace Folders" }
      --  )
      --  nnoremap("<leader>la", ":Lspsaga code_action<cr>", { desc = "Code Action" })
      --  nnoremap("<leader>le", ":Lspsaga show_line_diagnostics<cr>", { desc = "Show Line Diagnostics" })
      --  nnoremap("<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go To Definition" })
      --  nnoremap("<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Go To Declaration" })
      --  nnoremap("<leader>li", ":LspInfo<cr>", { desc = "Connected Language Servers" })
      --  nnoremap("<leader>lI", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go To Implementation" })
      --  nnoremap("<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { desc = "Format Code" })
      --  nnoremap("<leader>lk", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Signature Help" })
      --  nnoremap("<leader>lK", ":Lspsaga hover_doc<cr>", { desc = "Hover Commands" })
      --  nnoremap("<leader>ln", ":Lspsaga diagnostic_jump_next<cr>", { desc = "Go To Next Diagnostic" })
      --  nnoremap("<leader>lN", ":Lspsaga diagnostic_jump_prev<cr>", { desc = "Go To Previous Diagnostic" })
      --  nnoremap("<leader>lr", ":Lspsaga rename<cr>", { desc = "Rename" }) -- your hook
      --  nnoremap("<leader>lR", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "References" })
      --  nnoremap("<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Type Definition" })
      --  nnoremap("<leader>lw", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", { desc = "Add Workspace Folder" })
      --  nnoremap("<leader>lW", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", { desc = "Remove Workspace Folder" })
      --end,
      transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it
      treesitter_analysis = true, -- treesitter variable context
      treesitter_analysis_max_num = 100, -- how many items to run treesitter analysis
      treesitter_analysis_condense = true, -- condense form for treesitter analysis
    })
  end
}

return M



-- Default keymaps
-- mode, key,           function
-------, ----,          ---------
-- n,    gr,            async references, definitions and context
-- n,    <Leader>gr,    show reference and context
-- i,    <m-k>,         signature help
-- n,    <c-k>,         signature help
-- n,    gW,            workspace symbol
-- n,    gD,            declaration
-- n,    gd,            definition
-- n,    g0,            document symbol
-- n,    <C-]>,         go to definition (if multiple show listview)
-- n,    gp,            definition preview (show Preview)
-- n,    <C-LeftMouse>, definition
-- n,    g<LeftMouse>,  implementation
-- n,    <Leader>gt,    treesitter document symbol
-- n,    <Leader>gT,    treesitter symbol for all open buffers
-- n,    <Leader> ct,   ctags symbol search
-- n,    <Leader> cg,   ctags symbol generate
-- n,    K,             hover doc
-- n,    <Space>ca,     code action (when you see 🏏 )
-- n,    <Space>la,     code lens action (when you see a codelens indicator)
-- v,    <Space>ca,     range code action (when you see 🏏 )
-- n,    <Space>rn,     rename with floating window
-- n,    <Leader>re,    rename (lsp default)
-- n,    <Leader>gi,    hierarchy incoming calls
-- n,    <Leader>go,    hierarchy outgoing calls
-- n,    gi,            implementation
-- n,    <Space> D,     type definition
-- n,    gL,            show line diagnostic
-- n,    gG,            show diagnostic for all buffers
-- n,    ]d,            next diagnostic
-- n,    [d,            previous diagnostic
-- n,    <Leader> dt,   diagnostic toggle(enable/disable)
-- n,    ]r,            next treesitter reference/usage
-- n,    [r,            previous treesitter reference/usage
-- n,    <Space> wa,    add workspace folder
-- n,    <Space> wr,    remove workspace folder
-- n,    <Space> wl,    print workspace folder
-- n,    <Leader>k,     toggle reference highlight
-- i/n,  <C-p>,         previous item in list
-- i/n,  <C-n>,         next item in list
-- i/n,  number 1~9,    move to ith row/item in the list
-- i/n,  <Up>,          previous item in list
-- i/n,  <Down>,        next item in list
-- n,    <Ctrl-w>j,     move cursor to preview (windows move to bottom view point)
-- n,    <Ctrl-w>k,     move cursor to list (windows move to up view point)
-- i/n,  <C-o>,         open preview file in nvim/Apply action
-- n,    <C-v>,         open preview file in nvim with vsplit
-- n,    <C-s>,         open preview file in nvim with split
-- n,    <Enter>,       open preview file in nvim/Apply action
-- n,    <ESC>,         close listview of floating window
-- i/n,  <C-e>,         close listview of floating window
-- n,    <C-q>,         close listview and send results to quickfix
-- i/n,  <C-b>,         previous page in listview
-- i/n,  <C-f>,         next page in listview
-- i/n,  <C-s>,         save the modification to preview window to file
