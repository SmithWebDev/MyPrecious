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

    -- Additional
    'onsails/lspkind-nvim',                -- https://github.com/onsails/lspkind-nvim},
    'windwp/nvim-autopairs',               -- https://github.com/windwp/nvim-autopairs
    'nvim-lua/plenary.nvim',
    'jbyuki/nabla.nvim',

    -- Premade Snippet Plugins
    'honza/vim-snippets',                  -- https://github.com/honza/vim-snippets
    'rafamadriz/friendly-snippets',        -- https://github.com/rafamadriz/friendly-snippets
  },

  config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local luasnip = require("luasnip")
    local u = require("smithwebdev.core.utils")
    local trig = u.trigger_completion

    lspkind.init()

    local has_words_before = function()
      if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
      end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {'i', 's'}),
        ['<C-e>'] = cmp.mapping.close(),
        ['jk'] = cmp.mapping.confirm({ select = true })
      }),

      sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
        {name = 'emoji'},
        {name = 'orgmode'},
        {name = 'pandoc_references'},
        {name = 'cmp-pandoc.nvim'},
        { name = 'buffer', keyword_length = 5 },
        { name = 'nvim_lsp_signature_help' },
      }),

      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          menu = ({
            luasnip  = "[SNIP]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[LUA]",
            tags     = "[TAGS]",
            buffer   = '[BUFFER]',
            path     = '[PATH]',
            emoji    = '[EMOJI]',
            orgmode  = '[ORG]',
            pandoc   = '[PDOC]'
          })
        }),
      },
    })

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline({
        --['<C-j>'] = cmp.mapping.select_next_item(),
        --['<C-k>'] = cmp.mapping.select_prev_item(),
        --['jk'] = cmp.mapping.confirm({ select = true })
      }),
      sources = {
        { name = 'buffer', keyword_length = 5  }
      },
      --view = {
      --  entries = { name = 'wildmenu', separator = '|' }
      --}
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline({
        --['<C-j>'] = cmp.mapping.select_next_item(),
        --['<C-k>'] = cmp.mapping.select_prev_item(),
        --['jk'] = cmp.mapping.confirm({ select = true })
      }),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      --view = {
      --  entries = { name = 'wildmenu', separator = '|' }
      --}
    })

  end
}

return M
