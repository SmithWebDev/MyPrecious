local M = {}

M.plugin = {
  'VonHeikemen/lsp-zero.nvim', -- https://github.com/VonHeikemen/lsp-zero.nvim

  requires = {
    'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig
    'williamboman/mason.nvim', -- https://github.com/williamboman/mason.nvim
    'williamboman/mason-lspconfig.nvim', -- https://github.com/williamboman/mason-lspconfig.nvim
    'hrsh7th/nvim-cmp', -- https://github.com/hrsh7th/nvim-cmp
    'hrsh7th/cmp-buffer', -- https://github.com/hrsh7th/cmp-buffer
    'hrsh7th/cmp-path', -- https://github.com/hrsh7th/cmp-path
    'saadparwaiz1/cmp_luasnip', -- https://github.com/saadparwaiz1/cmp_luasnip
    'hrsh7th/cmp-nvim-lsp', -- https://github.com/hrsh7th/cmp-nvim-lsp
    'hrsh7th/cmp-nvim-lua', -- https://github.com/hrsh7th/cmp-nvim-lua
    'DNLHC/glance.nvim', -- https://github.com/DNLHC/glance.nvim
  },

  config = function()
    local lsp = require("lsp-zero")
    --lsp.preset('recommended')
    lsp.set_preferences({
      suggest_lsp_servers = true,
      setup_servers_on_start = true,
      set_lsp_keymaps = false,
      confirgure_diagnostics = true,
      cmp_capabilities = true,
      manage_nvim_cmp = false,
      call_servers = 'local',
      sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = ''
      }
    })



    lsp.on_attach(function(client, bufnr)
      print("Attached to " .. client.name)

      local nnoremap = require("smithwebdev.core.utils").nnoremap

      vim.keymap.set("n",
        "<leader>ll",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
        { desc = "List Workspace Folders" }
      )
      --vim.keymap.set("n", "<leader>li", ":LspInfo<cr>",                                       { desc = "Connected Language Servers" })
      --vim.keymap.set("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>",              { desc = "Go To Definition" })
      --vim.keymap.set("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>",             { desc = "Go To Declaration" })
      --vim.keymap.set("n", "<leader>lI", "<cmd>lua vim.lsp.buf.implementation()<CR>",          { desc = "Go To Implementation" })
      --vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format { async = true }<CR>",   { desc = "Format Code" })
      --vim.keymap.set("n", "<leader>lk", "<cmd>lua vim.lsp.buf.signature_help()<cr>",          { desc = "Signature Help" })
      --vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>",              { desc = "References" })
      --vim.keymap.set("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>",         { desc = "Type Definition" })
      --vim.keymap.set("n", "<leader>lw", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",    { desc = "Add Workspace Folder" })
      --vim.keymap.set("n", "<leader>lW", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", { desc = "Remove Workspace Folder" })
      --vim.keymap.set("n", "<leader>la", ":Lspsaga code_action<cr>",                           { desc = "Code Action" })
      --vim.keymap.set("n", "<leader>le", ":Lspsaga show_line_diagnostics<cr>",                 { desc = "Show Line Diagnostics" })
      --vim.keymap.set("n", "<leader>ln", ":Lspsaga diagnostic_jump_next<cr>",                  { desc = "Go To Next Diagnostic" })
      --vim.keymap.set("n", "<leader>lK", ":Lspsaga hover_doc<cr>",                             { desc = "Hover Commands" })
      --vim.keymap.set("n", "<leader>lN", ":Lspsaga diagnostic_jump_prev<cr>",                  { desc = "Go To Previous Diagnostic" })
      --vim.keymap.set("n", "<leader>lr", ":Lspsaga rename<cr>",                                { desc = "Rename" })

      --vim.keymap.set('', '', '', {desc = ""})
      vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", { desc = "Format Code" })
      vim.keymap.set('n', '<leader>lgf', '<cmd>Lspsaga lsp_finder<CR>', { desc = "LSP Finder" })
      vim.keymap.set('n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration<CR>', { desc = "Declaration" })
      vim.keymap.set('n', '<leader>lgd', '<cmd>Lspsaga peek_definition()<CR>', { desc = "Peek Definition" })
      vim.keymap.set('n', '<leader>lgi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { desc = "Implementation" })
      vim.keymap.set('n', '<leader>lca', '<cmd>Lspsaga code_action<CR>', { desc = "Code Action" })
      vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "References" })
      vim.keymap.set('n', '<leader>lrn', '<cmd>Lspsaga rename<CR>', { desc = "Rename" })
      vim.keymap.set('n', '<leader>ld', '<cmd>Lspsaga show_line_diagnostics<CR>', { desc = "Show Line Diagnostics" })
      vim.keymap.set('n', '<leader>ld', '<cmd>Lspsaga show_cursor_diagnostics<CR>', { desc = "Show Line Diagnostics" })
      vim.keymap.set('n', '<leader>l[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>',
        { desc = "Jump to Previous diagnostic error" })
      vim.keymap.set('n', '<leader>l]d', '<cmd>Lspsaga diagnostic_jump_next<CR>',
        { desc = "Jump to Next diagnostic error" })
      vim.keymap.set("n", "<leader>lk", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Signature Help" })
      vim.keymap.set('n', '<leader>lK', '<cmd>Lspsaga hover-doc<CR>', { desc = "Hover Doc" })
      vim.keymap.set("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Type Definition" })
    end)

    lsp.setup()
    lsp.nvim_workspace()

    ----

    local glance = require('glance')
    local actions = glance.actions

    glance.setup({
      height = 18, -- Height of the window
      border = {
        enable = false, -- Show window borders. Only horizontal borders allowed
        top_char = '-',
        bottom_char = '-',
      },
      list = {
        position = 'right', -- Position of the list window 'left'|'right'
        width = 0.33, -- 33% width relative to the active window, min 0.1, max 0.5
      },
      theme = { -- This feature might not work properly in nvim-0.7.2
        enable = true, -- Will generate colors for the plugin based on your current colorscheme
        mode = 'auto', -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
      },
      mappings = {
        list = {
          ['j'] = actions.next, -- Bring the cursor to the next item in the list
          ['k'] = actions.previous, -- Bring the cursor to the previous item in the list
          ['<Down>'] = actions.next,
          ['<Up>'] = actions.previous,
          ['<Tab>'] = actions.next_location, -- Bring the cursor to the next location skipping groups in the list
          ['<S-Tab>'] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
          ['<C-u>'] = actions.preview_scroll_win(5),
          ['<C-d>'] = actions.preview_scroll_win(-5),
          ['v'] = actions.jump_vsplit,
          ['s'] = actions.jump_split,
          ['t'] = actions.jump_tab,
          ['<CR>'] = actions.jump,
          ['o'] = actions.jump,
          ['<leader>l'] = actions.enter_win('preview'), -- Focus preview window
          ['q'] = actions.close,
          ['Q'] = actions.close,
          ['<Esc>'] = actions.close,
        },
        preview = {
          ['Q'] = actions.close,
          ['<Tab>'] = actions.next_location,
          ['<S-Tab>'] = actions.previous_location,
          ['<leader>l'] = actions.enter_win('list'), -- Focus list window
        },
      },
      hooks = {},
      folds = {
        fold_closed = '',
        fold_open = '',
        folded = true, -- Automatically fold list on startup
      },
      indent_lines = {
        enable = true,
        icon = '│',
      },
      winbar = {
        enable = true, -- Available strating from nvim-0.8+
      },
    })
  end
}

return M
