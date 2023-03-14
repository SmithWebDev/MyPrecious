---------------------------------------------------------------------------------
local Quick_Close = vim.api.nvim_create_augroup('Quick_Close', { clear = true })

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = 'Quick_Close',
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query", -- :InspectTree
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", ":q<cr>", { buffer = event.buf, silent = true })
  end,
})
--------------------------------------------------------------------------------
local AutoSaveGroup = vim.api.nvim_create_augroup('autosave_user_events', { clear = true })
vim.api.nvim_create_autocmd({ 'TextChanged', 'InsertLeave' }, {
  group = AutoSaveGroup,
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local ft = vim.bo[bufnr].filetype
    local modifiable = vim.bo[bufnr].modifiable
    local is_empty_buftype = vim.bo[bufnr].buftype == ''
    local ignorelist = {
      'packer',
      'netrw',
      'TelescopePrompt',
      'lspinfo',
      'lsp-installer',
      'query',
      'tsplayground',
      'text',
      'harpoon',
      'scratch'
    }
    if not vim.tbl_contains(ignorelist, ft) and modifiable and is_empty_buftype then
      vim.cmd 'silent update!'
    end
  end
})

vim.api.nvim_create_autocmd({ 'TextChangedI', 'InsertEnter' }, {
  group = AutoSaveGroup,
  callback = function()
    if _G.autoleave_timer ~= nil then
      _G.autoleave_timer:stop()

      if not _G.autoleave_timer:is_closing() then
        _G.autoleave_timer:close()
      end
    end
    _G.autoleave_timer = vim.defer_fn(function()
      local key = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
      vim.api.nvim_feedkeys(key, 'n', false)
    end, 8000)
  end
})

vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePre' }, {
  pattern = '*',
  command = '%s/\\s\\+$//e',
  group = AutoSaveGroup
})

--vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePre' }, {
--  pattern = '*',
--  command = 'lua vim.lsp.buf.format {async = true}',
--  group = AutoSaveGroup
--})

--------------------------------------------------------------------------------
local CursorInsertMode = vim.api.nvim_create_augroup('CursorInsertMode', { clear = true })
vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
  callback = function()
    vim.opt.cursorline = true
  end,
  group = CursorInsertMode,
  desc = "Enable cursorline in normal mode",
})
vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
  callback = function()
    vim.opt.cursorline = false
  end,
  group = CursorInsertMode,
  desc = 'Disable cursorline on insert',
})
