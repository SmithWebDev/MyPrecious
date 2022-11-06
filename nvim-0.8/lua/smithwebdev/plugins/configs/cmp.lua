local M = {}

M.plugin = {
	'hrsh7th/nvim-cmp',

	requires = {
		-- CMP Addons --
		'hrsh7th/cmp-buffer',                  -- https://github.com/hrsh7th/cmp-buffer
		'hrsh7th/cmp-cmdline',                 -- https://github.com/hrsh7th/cmp-cmdline
		'octaltree/cmp-look',                  -- https://github.com/octaltree/cmp-look
		'saadparwaiz1/cmp_luasnip',            -- https://github.com/saadparwaiz1/cmp_luasnip
		'hrsh7th/cmp-nvim-lsp',                -- https://github.com/hrsh7th/cmp-nvim-lsp
		'hrsh7th/cmp-nvim-lsp-signature-help', -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
		'hrsh7th/cmp-nvim-lua',                -- https://github.com/hrsh7th/cmp-nvim-lua
		'quangnguyen30192/cmp-nvim-tags',      -- https://github.com/quangnguyen30192/cmp-nvim-tags
		'hrsh7th/cmp-path',                    -- https://github.com/hrsh7th/cmp-path
		'ray-x/cmp-treesitter',                -- https://github.com/ray-x/cmp-treesitter
		'hrsh7th/cmp-emoji',                   -- https://github.com/hrsh7th/cmp-emoji
		'nvim-orgmode/orgmode',                -- https://github.com/nvim-orgmode/orgmode
		'jc-doyle/cmp-pandoc-references',      -- https://github.com/jc-doyle/cmp-pandoc-references
		'aspeddro/cmp-pandoc.nvim',            -- https://github.com/aspeddro/cmp-pandoc.nvim
		'jcha0713/cmp-tw2css',                 -- https://github.com/jcha0713/cmp-tw2css
		'petertriho/cmp-git',                  -- https://github.com/petertriho/cmp-git
		-- Additional
		'onsails/lspkind-nvim',                -- https://github.com/onsails/lspkind-nvim               ,
		'windwp/nvim-autopairs',               -- https://github.com/windwp/nvim-autopairs
		'kyazdani42/nvim-web-devicons',        --https://github.com/kyazdani42/nvim-web-devicons
		'nvim-lua/plenary.nvim',
		'jbyuki/nabla.nvim',

		-- Premade Snippet Plugins
		'honza/vim-snippets',                  -- https://github.com/honza/vim-snippets
		'rafamadriz/friendly-snippets',        -- https://github.com/rafamadriz/friendly-snippets
	},

	config = function()
		local cmp = require('cmp')
		local lspkind = require('lspkind')

		cmp.setup({
			formatting = {
				format = lspkind.cmp_format({
					mode = 'symbol_text',
					maxwidth = 50,
					ellipsis_char = '...',
					menu = {
						buffer = '[Buffer]',
						nvim_lsp = '[LSP]',
						luasnip = '[LuaSnip]',
						nvim_lua = '[Lua]',
					},
				}),
			},
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
				['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
				['<C-e>'] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				--['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['jk'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true
        }),
				--['jk'] = cmp.mapping.complete(),
				['<C-j>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end, { 'i', 's' }),
				['<C-k>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { 'i', 's' }),
			}),
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
			}, {
				{ name = 'buffer' },
			}),
			window = {
				-- completion = cmp.config.window.bordered()<
				documentation = cmp.config.window.bordered(),
			},
		})

		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer', keyword_length = 5 },
			},
		})

		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' },
			}, {
				{ name = 'cmdline' },
			}),
		})
	end,
}

return M
