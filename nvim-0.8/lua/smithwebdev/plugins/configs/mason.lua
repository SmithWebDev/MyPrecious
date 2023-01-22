local M = {}

M.plugin = {
  "williamboman/mason.nvim", -- https://github.com/williamboman/mason.nvim

  requires = {
    { "williamboman/mason-lspconfig.nvim", after = "mason.nvim" }, -- https://github.com/williamboman/mason-lspconfig.nvim
    { "jayp0521/mason-null-ls.nvim", after = { "mason.nvim", "null-ls.nvim" } }, -- https://github.com/jayp0521/mason-null-ls.nvim
  },

  config = function()
    -- import mason plugin safely
    local mason_status, mason = pcall(require, "mason")
    if not mason_status then
      return
    end

    -- import mason-lspconfig plugin safely
    local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not mason_lspconfig_status then
      return
    end

    -- import mason-null-ls plugin safely
    local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
    if not mason_null_ls_status then
      return
    end

    -- enable mason
    mason.setup({
      icons = {
        -- The list icon to use for installed packages.
        package_installed = "✓",
        -- The list icon to use for packages that are installing, or queued for installation.
        package_pending = "➜",
        -- The list icon to use for packages that are not installed.
        package_uninstalled = "✗",
      },

      keymaps = {
        -- Keymap to expand a package
        toggle_package_expand = "<CR>",
        -- Keymap to install the package under the current cursor position
        install_package = "i",
        -- Keymap to reinstall/update the package under the current cursor position
        update_package = "u",
        -- Keymap to check for new version for the package under the current cursor position
        check_package_version = "v",
        -- Keymap to update all installed packages
        update_all_packages = "U",
        -- Keymap to check which installed packages are outdated
        check_outdated_packages = "C",
        -- Keymap to uninstall a package
        uninstall_package = "X",
        -- Keymap to cancel a package installation
        cancel_installation = "<C-c>",
        -- Keymap to apply language filter
        apply_language_filter = "<C-f>",
      },
    })

    servers = {
      "tsserver",
      "html",
      "cssls",
      "tailwindcss",
      "sumneko_lua",
      "elixirls",
    },

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = servers,
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_null_ls.setup({
      -- list of formatters & linters for mason to install
      ensure_installed = {
        "prettier", -- ts/js formatter
        "stylua", -- lua formatter
        "eslint_d", -- ts/js linter
        "rubocop", -- ruby linter
        "erb_lint", -- eruby linter
        "markdownlint", -- markdown linter
        "actionlint", -- yaml linter
        --"cspell", -- spelling linter
        --"standardrb", -- ruby linter/formater/styleguide
      },
      -- auto-install configured formatters & linters (with null-ls)
      automatic_installation = true,
    })
  end,
}

return M
