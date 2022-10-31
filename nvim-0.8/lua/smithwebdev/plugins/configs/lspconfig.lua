local M = {}

M.plugin = {
	"neovim/nvim-lspconfig",

	config = function()
		local lspconfig = require("lspconfig")
		local lsp_defaults = lspconfig.util.default_config
		require("smithwebdev.lsp").on_attach()

		lsp_defaults.capabilities =
			vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

		lspconfig.solargraph.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}

return M
