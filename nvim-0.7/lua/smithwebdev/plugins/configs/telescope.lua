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
    'benfowler/telescope-luasnip.nvim',
    'ThePrimeagen/harpoon'
    },

  -- Setup telescope.nvim settings AFTER the plugin (telescope.nvim) is loaded
  config = function()
    local telescope = require('telescope')
    local telescope_builtin = require('telescope.builtin')
    local telescope_actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        layout_config = { prompt_position = 'bottom' },
        layout_strategy = 'horizontal',
        sorting_strategy = 'descending',
        use_less = false,
      },

      extensions = {
        file_browser = {
          mappings = {
            ['i'] = {
              ['<esc>'] = require("telescope.actions").close,
              ['jj'] = {'<esc', type = 'command' },
            },
            ['n'] = {
              ['jk'] = require('telescope.actions').close,
            },
          },
        },
        --fzy_native = {
        --  override_generic_sorter = false,
        --  override_file_sorter = true,
        --},
        dash = {},
      },
    })

    telescope.load_extension('file_browser')
    telescope.load_extension('luasnip')

    function _G.TelescopeFindConfigFiles()
      local configdir = vim.fn.expand('$HOME/.config/nvim-nightly')
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


    local default_opts = {noremap = true, silent = true}
    vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope file_browser', default_opts)
    vim.api.nvim_set_keymap('n', '<leader>fc', [[<Cmd>lua TelescopeFindConfigFiles()<CR>]], default_opts)
    vim.api.nvim_set_keymap('n', '<leader>ff', [[<Cmd>lua TelescopeFindFiles()<CR>]], default_opts)
    vim.api.nvim_set_keymap('n', '<leader>fg', [[<Cmd>lua TelescopeLiveGrep()<CR>]], default_opts)
    vim.api.nvim_set_keymap('n', '<leader>fh', [[<Cmd>Telescope help_tags<CR>]], default_opts)
    vim.api.nvim_set_keymap('n', '<leader>fm', [[<Cmd>lua TelescopeKeyMap()<CR>]], default_opts)
    vim.api.nvim_set_keymap('n', '<leader>fq', [[<Cmd>lua TelescopeQuickFix()<CR>]], default_opts)
    vim.api.nvim_set_keymap('n', '<leader>fs', [[<Cmd>Telescope luasnip<CR>]], default_opts)
    vim.api.nvim_set_keymap('n', '<leader>ft', [[<Cmd>lua TelescopeTags()<CR>]], default_opts)
  end,
}

return M
