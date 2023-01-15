--local theme = 'mirodark'
--local theme = 'tokyonight'
--local theme = 'moonlight'
--local theme = 'petrel'
--local theme = 'gloombuddy'
--local theme = 'bluedrake'
--local theme = 'falcon'
--local theme = 'oxocarbon-lua'
--local theme = 'Sakura'
--local theme = 'industry'
--local theme = 'SerialExperimentsLain'
--local theme = 'northpole'
--local theme = 'southwest-fog'
local theme = 'underwater'

local ok, err = pcall(vim.cmd, 'colorscheme ' .. theme)

if not ok then
  vim.cmd('colorscheme default')
else
--  vim.api.nvim_set_hl(0, "Normal", { bg= 'none'})
--  vim.api.nvim_set_hl(0, "NormalFloat", { bg= 'none'})
--  vim.api.nvim_set_hl(0, "cursorline", { bg= 'none'})
  print "Theme Loaded"
end

--vim.api.nvim_create_autocmd('ColorScheme', {
--  callback = function()
--    vim.cmd 'highlight! WhichKeyFloat bg=#000000'
--  end
--})
print('Theme has been set to ' .. theme)
