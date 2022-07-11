local M = {}

M.plugin = {
  'rcarriga/neotest', --https://github.com/rcarriga/neotest

  requires = {
    'vim-test/vim-test',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim', -- https://github.com/antoinemadec/FixCursorHold.nvim
    'nvim-neotest/neotest-vim-test', -- https://github.com/nvim-neotest/neotest-vim-test
    'olimorris/neotest-rspec', -- https://github.com/olimorris/neotest-rspec
    'haydenmeade/neotest-jest', -- https://github.com/haydenmeade/neotest-jest
  },

  config = function()
    require('neotest').setup({
      adapters = {
        require("neotest-vim-test"),
        require('neotest-rspec'),
        require("neotest-jest")({
          jestCommand = "npm test --"
        }),
      }
    })

    local u = require 'smithwebdev.core.utils'
    local noremap = u.noremap
    local nnoremap = u.nnoremap
    local inoremap = u.inoremap
    local vnoremap = u.vnoremap
    local neotest = require('neotest').run

    function _G.Nearest_Test()
      require('neotest').run.run({})
    end

    function _G.Current_File()
      require('neotest').run.run(vim.fn.expand('%'))
    end

    function _G.Attach_Test()
      require('neotest').run.attach()
    end

    function _G.Stop_Test()
      require('neotest').run.stop()
    end

    -- keybindings
    nnoremap('<leader>Na', '<cmd>lua Attach_Test()<CR>',  { desc = 'Toggle Summary Window' })
    nnoremap('<leader>Nc', '<cmd>lua Current_File()<CR>', { desc = 'Run All Test Current File' })
    nnoremap('<leader>Nj', '<cmd>lua Nearest_Test()<CR>', { desc = 'Run Nearest Test Current File' })
    nnoremap('<leader>Nx', '<cmd>lua Stop_Test()<CR>',    { desc = 'Stop Running Tests' })

    -- nnoremap('<leader>ua', '<cmd>UltestAttach<CR>', { desc = 'Attach Live Debugging' })
    -- nnoremap('<leader>uj', '<cmd>UltestNearest<CR>', { desc = 'Run Nearest Test Current' })
    -- nnoremap('<leader>ur', '<cmd>Ultest<CR>', { desc = 'Run All Test Current File' })
    -- nnoremap('<leader>us', '<cmd>UltestSummary<CR>', { desc = 'Toggle Summary Window' })
    -- nnoremap('<leader>ux', '<cmd>UltestStop<CR>', { desc = 'Stop Running Tests' })
  end
}

return M
