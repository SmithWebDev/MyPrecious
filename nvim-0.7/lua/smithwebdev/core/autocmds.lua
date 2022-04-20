-- local AutoSave = vim.api.nvim_create_augroup('AutoSave', { clear = true })
-- vim.api.nvim_create_autocmd("BufEnter", { command = "echo 'Hello'", group = AutoSave})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  command = 'wincmd L'
  })

local UltestRunner = vim.api.nvim_create_augroup('UltestRunner', {clear = true})
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*',
  command = 'UltestNearest',
  group = UltestRunner
})

local AutoSaveGroup = vim.api.nvim_create_augroup('autosave_user_events', { clear = true})
vim.api.nvim_create_autocmd({ 'TextChanged', 'InsertLeave' }, {
  group = AutoSaveGroup,

  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local ft = vim.bo[bufnr].filetype
    local modifiable = vim.bo[bufnr].modifiable
    local is_empty_buftype = vim.bo[bufnr].buftype == ''
    local ignorelist = { 'packer', 'netrw', 'TelescopePrompt', 'lspinfo', 'lsp-installer', 'query', 'tsplayground', 'text', 'harpoon', 'scratch' }

    if not vim.tbl_contains(ignorelist, ft) and modifiable and is_empty_buftype then
      vim.cmd 'silent update'
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
    end, 2000)
  end
})
