print("LSP directory loaded")

local M = {}

-- This will be called when the LSP client attaches to the file buffer
function M.on_attach(client, bufnr)
	--require("aerial").on_attach(client, bufnr)
	print("Attached to " .. client.name)

	local nnoremap = require("smithwebdev.core.utils").nnoremap

	nnoremap(
		"<leader>ll",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
		{ desc = "List Workspace Folders" }
	)
	nnoremap("<leader>li", ":LspInfo<cr>", { desc = "Connected Language Servers" })
	nnoremap("<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go To Definition" })
	nnoremap("<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc = "Go To Declaration" })
	nnoremap("<leader>lI", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go To Implementation" })
	nnoremap("<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { desc = "Format Code" })
	nnoremap("<leader>lk", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc = "Signature Help" })
	nnoremap("<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc = "References" })
	nnoremap("<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", { desc = "Type Definition" })
	nnoremap("<leader>lw", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", { desc = "Add Workspace Folder" })
	nnoremap("<leader>lW", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", { desc = "Remove Workspace Folder" })
	nnoremap("<leader>la", ":Lspsaga code_action<cr>", { desc = "Code Action" })
	nnoremap("<leader>le", ":Lspsaga show_line_diagnostics<cr>", { desc = "Show Line Diagnostics" })
	nnoremap("<leader>ln", ":Lspsaga diagnostic_jump_next<cr>", { desc = "Go To Next Diagnostic" })
	nnoremap("<leader>lK", ":Lspsaga hover_doc<cr>", { desc = "Hover Commands" })
	nnoremap("<leader>lN", ":Lspsaga diagnostic_jump_prev<cr>", { desc = "Go To Previous Diagnostic" })
	nnoremap("<leader>lr", ":Lspsaga rename<cr>", { desc = "Rename" })
end

-- Let the LSP server know what capabilities you want when it
-- attaches to the file buffer
--function M.get_capabilities()
--	local capabilities
--
--	local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
--	if ok then
--		-- If nvim-cmp is loaded, then use it's capabilities
--		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
--	else
--		-- Else we provide our own capabilities here
--		capabilities = vim.lsp.protocol.make_client_capabilities()
--		capabilities.textDocument.completion.completionItem.snippetSupport = true
--	end
--
--	return capabilities
--end

return M
