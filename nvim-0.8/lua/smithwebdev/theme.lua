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
local theme = 'SerialExperimentsLain'

local ok, err = pcall(vim.cmd, 'colorscheme ' .. theme)

if not ok then
  vim.cmd('colorscheme default')
else
  print "Theme Loaded"
end

print('Theme has been set to ' .. theme)
