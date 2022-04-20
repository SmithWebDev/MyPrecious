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
    'hrsh7th/cmp-nvim-lua',                -- https://github.com/hrsh7th/cmp-nvim-lua
    'quangnguyen30192/cmp-nvim-tags',      -- https://github.com/quangnguyen30192/cmp-nvim-tags
    'hrsh7th/cmp-path',                    -- https://github.com/hrsh7th/cmp-path
    'ray-x/cmp-treesitter',                -- https://github.com/ray-x/cmp-treesitter

    -- Additional 
    'onsails/lspkind-nvim',                -- https://github.com/onsails/lspkind-nvim},
    'windwp/nvim-autopairs',               -- https://github.com/windwp/nvim-autopairs

    -- Premade Snippet Plugins
    'honza/vim-snippets',                  -- https://github.com/honza/vim-snippets
    'rafamadriz/friendly-snippets',        -- https://github.com/rafamadriz/friendly-snippets
  },

  config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')
    local u = require("smithwebdev.core.utils")
    local trig = u.trigger_completion

    lspkind.init()

    local has_any_words_before = function()
      if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
      end
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    --local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    --cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

    cmp.setup.cmdline(
    ':', {
      sources = {
        { name = 'cmdline' }
      },
    },
    '/', {
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup({
      snippet = {
        expand = function(args)
          local luasnip = require('luasnip')
          if not luasnip then
            return
          end
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<c-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, {"i", "s" }),

        ["<c-k>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {"i", "s" }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["jk"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true
        },
        ["<c-Space>"] = cmp.mapping.complete()
      },
      sources = {
        { name = 'luasnip'},
        { name = 'tags'},
        { name = 'nvim_lsp'},
        { name = 'nvim_lua'},
        { name = 'buffer', keyword_length = 5 },
        { name = 'path'},
        { name = 'orgmode'},
      },
      formatting = {
        format       = lspkind.cmp_format({
          with_text  = false,
          maxwidth   = 50,
          menu       = ({
            luasnip  = '[SNIP]',
            nvim_lsp = '[LSP]',
            tags     = '[TAGS]',
            nvim_lua = '[LUA]',
            buffer   = '[BUFFER]',
            path     = '[PATH]',
            orgmode  = '[ORGMODE]'
          }),
        }),
        experimental = {
          native_menu = false,
          ghost_text = false,
        },
      },
    })
  end

  --inoremap('<CR>', trig)
}

return M
