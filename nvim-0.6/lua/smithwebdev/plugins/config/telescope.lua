local M = {}

M.plugin = {
  'nvim-telescope/telescope.nvim',

  -- This plugin requires that the following plugins be loaded BEFORE telescope.nvim
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-media-files.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-frecency.nvim',
    'nvim-telescope/telescope-fzy-native.nvim',
    --'fhill2/telescope-ultisnips.nvim',
    'benfowler/telescope-luasnip.nvim',
    'ThePrimeagen/harpoon'
    },

  -- Make sure this plugin (telescope.nvim) is loaded AFTER mapx is loaded
  after = 'mapx.nvim',

  -- Setup telescope.nvim settings AFTER the plugin (telescope.nvim) is loaded
  config = function()
    local telescope = require('telescope')
    local telescope_builtin = require('telescope.builtin')
    local telescope_actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        layout_config = { prompt_position = 'top' },
        layout_strategy = 'flex',
        sorting_strategy = 'ascending',
        use_less = false,
      },

      extensions = {
        file_browser = {
          mappings = {
            ['i'] = {},
            ['n'] = {},
          },
        },
        --fzy_native = {
        --  override_generic_sorter = false,
        --  override_file_sorter = true,
        --},
        dash = {
        },
      },
    })

    --telescope.load_extension('ultisnips')
    telescope.load_extension('file_browser')
    telescope.load_extension('luasnip')

    function _G.TelescopeFindConfigFiles()
      local configdir = vim.fn.stdpath('config')
      telescope_builtin.find_files({
        find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden', configdir },
        previewer = false,
      })
    end

    function _G.TelescopeFindFiles()
      telescope_builtin.find_files({
        find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
        previewer = false,
      })
    end

    function _G.TelescopeFileBrowser()
      telescope_builtin.file_browser({
      })
    end

    function _G.TelescopeLiveGrep()
      telescope_builtin.live_grep({})
    end

    function _G.TelescopeKeyMap()
      telescope_builtin.keymaps({})
    end

    function _G.TelescopeQuickFix()
      telescope_builtin.quickfix({
        mappings = {
          i = {
            ["<C-q>"] = telescope_actions.send_to_qflist
          },
        },
      })
    end

    function _G.TelescopeTags()
      telescope_builtin.tags({})
    end

    function _G.TelescopeLuaSnip()
      require'telescope'.extensions.luasnip.luasnip{}
    end

    nnoremap('<leader>fb', ':Telescope file_browser')
    nnoremap('<leader>fc', [[<Cmd>lua TelescopeFindConfigFiles()<CR>]])
    nnoremap('<leader>ff', [[<Cmd>lua TelescopeFindFiles()<CR>]])
    nnoremap('<leader>fh', [[<Cmd>Telescope help_tags<CR>]])
    nnoremap('<leader>fl', [[<Cmd>lua TelescopeLiveGrep()<CR>]])
    nnoremap('<leader>fm', [[<Cmd>lua TelescopeKeyMap()<CR>]])
    nnoremap('<leader>fq', [[<Cmd>lua TelescopeQuickFix()<CR>]])
    nnoremap('<leader>fs', [[<Cmd>Telescope luasnip<CR>]])
    nnoremap('<leader>ft', [[<Cmd>lua TelescopeTags()<CR>]])
  end,
}

return M
