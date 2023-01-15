local M = {}

M.plugin = {
  'akinsho/toggleterm.nvim', -- https://github.com/akinsho/toggleterm.nvim

  tag = '*',

  config = function()
    require'toggleterm'.setup({
      -- size can be a number or function which is passed the current terminal
      --size = function(term)
      --  if term.direction == "horizontal" then
      --    return 15
      --  elseif term.direction == "vertical" then
      --    return vim.o.columns * 0.2
      --  end
      --end,
      --open_mapping = [[<c-\>]],
      open_mapping = [[<C-T>]],
      --on_create = fun(t: Terminal), -- function to run when the terminal is first created
      --on_open = fun(t: Terminal), -- function to run when the terminal opens
      --on_close = fun(t: Terminal), -- function to run when the terminal closes
      --on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
      --on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
      --on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
      --  hide_numbers = true, -- hide the number column in toggleterm buffers
      --shade_filetypes = {},
      --autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
      --highlights = {
      --  -- highlights which map to a highlight group name and a table of it's values
      --  -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
      --  Normal = {
      --    guibg = "<VALUE-HERE>",
      --  },
      --  NormalFloat = {
      --    link = 'Normal'
      --  },
      --  FloatBorder = {
      --    guifg = "<VALUE-HERE>",
      --    guibg = "<VALUE-HERE>",
      --  },
      --},
      --shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
      --shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      --start_in_insert = true,
      --insert_mappings = true, -- whether or not the open mapping applies in insert mode
      --terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      --persist_size = true,
      --persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
      --direction = 'vertical' | 'horizontal' | 'tab' | 'float',
      direction = 'vertical',
      --close_on_exit = true, -- close the terminal window when the process exits
      --shell = vim.o.shell, -- change the default shell
      --auto_scroll = true, -- automatically scroll to the bottom on terminal output
      ---- This field is only relevant if direction is set to 'float'
      --float_opts = {
      --  -- The border key is *almost* the same as 'nvim_open_win'
      --  -- see :h nvim_open_win for details on borders however
      --  -- the 'curved' border is a custom border type
      --  -- not natively supported but implemented in this plugin.
      --  border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
      --  -- like `size`, width and height can be a number or function which is passed the current terminal
      --  width = <value>,
      --  height = <value>,
      --  winblend = 3,
      --},
      --winbar = {
      --  enabled = false,
      --  name_formatter = function(term) --  term: Terminal
      --    return term.name
      --  end
      --},
    })

    local Terminal = require('toggleterm.terminal').Terminal

    --==LazyGit Terminal==
    --============================
    -- local lazygit = Terminal:new({
    --   cmd = 'lazygit',
    --   direction = 'float',
    --   hidden = true
    -- })

    -- function _lazygit_toggle()
    --   lazygit:toggle()
    -- end

    --==Rails==
    --==================================

    -- Bin/Dev
    local bin_dev = Terminal:new({
      cmd = 'bin/dev',
      direction = 'vertical',
      hidden = true,
      size = 20,
      count = 1,
    })

    function _bin_dev_toggle()
      bin_dev:toggle()
    end
    --

    -- Console
    local rails_console = Terminal:new({
      cmd = 'rails console',
      direction = 'vertical',
      hidden = true,
      size = 20,
      count = 2,
    })

    function _rails_console_toggle()
      rails_console:toggle()
    end
    --

    -- Server
    local rails_server = Terminal:new({
      cmd = 'rails server',
      direction = 'vertical',
      hidden = true,
      size = 20,
      count = 3,
    })

    function _rails_server_toggle()
      rails_server:toggle()
    end
    --

    -- Spotify
    local spotify  = Terminal:new({
      cmd = 'spt',
      direction = 'float',
      hidden = true,
      count = 4,
    })

    function _spotify_toggle()
      spotify:toggle()
    end
    --

    --==Keybindings==
    --==================================
    local u = require 'smithwebdev.core.utils'
    local nnoremap = u.nnoremap
    local tnoremap = u.tnoremap

    -- nnoremap('<leader>gl',          '<cmd>lua _lazygit_toggle()<CR>',       { desc = 'Open Lazygit in Floating Terminal'})
    nnoremap('<leader><leader>rbd', '<cmd>lua _bin_dev_toggle()<CR>',       { desc = 'Open Bin/Dev in Vertical Terminal'})
    nnoremap('<leader><leader>rc',  '<cmd>lua _rails_console_toggle()<CR>', { desc = 'Open Rails Console in Vertical Terminal'})
    nnoremap('<leader><leader>rs',  '<cmd>lua _rails_server_toggle()<CR>',  { desc = 'Open Rails Server in Vertical Terminal'})

    nnoremap('<leader><leader>tts',  '<cmd>lua _spotify_toggle()<CR>',       { desc = 'Open Spotify TUI'})
    nnoremap('<leader><leader>tta', '<cmd>ToggleTermToggleAll<CR>',         { desc = 'Toggle All Terminals'})
    nnoremap('<leader><leader>tt1', '<cmd>1ToggleTerm<CR>',                 { desc = 'Toggle All Terminals'})
    nnoremap('<leader><leader>tt2', '<cmd>2ToggleTerm<CR>',                 { desc = 'Toggle All Terminals'})
    nnoremap('<leader><leader>tt3', '<cmd>3ToggleTerm<CR>',                 { desc = 'Toggle All Terminals'})
    nnoremap('<leader><leader>tt4', '<cmd>4ToggleTerm<CR>',                 { desc = 'Toggle All Terminals'})
    nnoremap('<leader><leader>ttc', '<cmd>ToggleTermSendCurrentLine',       { desc = 'Send Current Line to Terminal'})
    nnoremap('<leader><leader>ttn', '<cmd>ToggleTermSetName',               { desc = 'Set Terminal Name'})
    nnoremap('<leader><leader>ttv', '<cmd>ToggleTermSendVisualLine',        { desc = 'Send Current Visual Line to Terminal'})
    nnoremap('<leader><leader>ttV', '<cmd>ToggleTermSendVisualSelection',   { desc = 'Send Current Visual Selection to Terminal'})

    tnoremap('<esc>',               [[<C-\><C-n>]],                         { desc = 'Close Terminal'})
    tnoremap('<C-h>',               [[<Cmd>wincmd h<CR>]],                  { desc = 'Move Terminal Left'})
    tnoremap('<C-j>',               [[<Cmd>wincmd j<CR>]],                  { desc = 'Move Terminal Down'})
    tnoremap('<C-k>',               [[<Cmd>wincmd k<CR>]],                  { desc = 'Move Terminal Up'})
    tnoremap('<C-l>',               [[<Cmd>wincmd l<CR>]],                  { desc = 'Move Terminal Right'})
  end
}

return M
