local M = {}

M.plugin = {
	"neovim/nvim-lspconfig",

  after = {
    'mason.nvim'
  },

	config = function()
		-- import lspconfig plugin safely
		local lspconfig_status, lspconfig = pcall(require, "lspconfig")
		if not lspconfig_status then
			return
		end

		-- import cmp-nvim-lsp plugin safely
		local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		if not cmp_nvim_lsp_status then
			return
		end

		-- enable keybinds only for when lsp server available
		local on_attach = function(client, bufnr)
			-- set keybinds
			local u = require("smithwebdev.core.utils")
			local nnoremap = u.nnoremap

			nnoremap("gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "got to declaration" })
			nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "go to implementation" })
			nnoremap("<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go To Definition" })
			nnoremap("<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Go To Declaration" })
			nnoremap("<leader>lI", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go To Implementation" })
			nnoremap("<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", { desc = "Format Code" })
			nnoremap("<leader>lk", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Signature Help" })
			nnoremap(
				"<leader>ll",
				"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
				{ desc = "List Workspace Folders" }
			)
			nnoremap("<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "References" })
			nnoremap("<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Type Definition" })
			nnoremap("<leader>lw", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", { desc = "Add Workspace Folder" })
			nnoremap(
				"<leader>lW",
				"<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
				{ desc = "Remove Workspace Folder" }
			)

			-- typescript specific keymaps (e.g. rename file and update imports)
			if client.name == "tsserver" then
				nnoremap(
					"<leader><leader>Trf",
					":TypescriptRenameFile<CR>",
					{ desc = "rename file and update imports" }
				)
				nnoremap(
					"<leader><leader>Toi",
					":TypescriptOrganizeImports<CR>",
					{ desc = "organize imports (not in youtube nvim video)" }
				)
				nnoremap(
					"<leader><leader>Tru",
					":TypescriptRemoveUnused<CR>",
					{ desc = "remove unused variables (not in youtube nvim video)" }
				)
			end
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["solargraph"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure lua server (with special settings)
		lspconfig["sumneko_lua"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}

return M
