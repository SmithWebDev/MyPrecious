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
      },
      diagnostic = {
        enabled = true
      },
      status = {
        virtual_text = true
      }
    })

    local u = require 'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

    function _G.Attach_Test()
      require('neotest').run.attach()
    end

    function _G.Nearest_Test()
      require('neotest').run.run()
    end

    function _G.Current_File()
      require('neotest').run.run(vim.fn.expand('%'))
    end

    function _G.Stop_Test()
      require('neotest').run.stop()
    end

    function _G.Summary_Toggle()
      require('neotest').summary.toggle()
    end

    function _G.Clear_Marked()
      require('neotest').summary.clear_marked()
    end

    function _G.Run_Marked()
      require('neotest').summary.run_marked()
    end

    function _G.Test_Result()
      require('neotest').output.open()
    end

    function _G.Jump_Next()
      require('neotest').jump.next()
    end

    function _G.Jump_Prev()
      require('neotest').jump.prev()
    end


    -- keybindings
    nnoremap('<leader>ra', '<cmd>lua Attach_Test()<CR>',  { desc = 'Attach Test' })
    nnoremap('<leader>ru', '<cmd>lua Clear_Marked()<CR>', { desc = 'Clear Marked Tests' })
    nnoremap('<leader>rcf', '<cmd>lua Current_File()<CR>', { desc = 'Run All Test Current File' })
    nnoremap('<leader>rn', '<cmd>lua Nearest_Test()<CR>', { desc = 'Run Nearest Test Current File' })
    nnoremap('<leader>rj', '<cmd>lua Jump_Next()<CR>', { desc = 'Jump to Next Test' })
    nnoremap('<leader>rk', '<cmd>lua Jump_Prev()<CR>', { desc = 'Jump to Previous Test' })
    nnoremap('<leader>rz', '<cmd>lua Run_Marked()<CR>', { desc = 'Run Marked Tests' })
    nnoremap('<leader>rx', '<cmd>lua Stop_Test()<CR>',    { desc = 'Stop Running Tests' })
    nnoremap('<leader>rs', '<cmd>lua Summary_Toggle()<CR>',  { desc = 'Toggle Summary Window' })
    nnoremap('<leader>rd', '<cmd>lua Test_Result()<CR>',  { desc = 'Toggle Test Result Window' })

  end
}

return M
