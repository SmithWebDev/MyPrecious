--local theme = 'mirodark'
--local theme = 'tokyonight'
local theme = 'moonlight'
--local theme = 'gloombuddy'

local ok, err = pcall(vim.cmd, 'colorscheme '.. theme)

if not ok then
  vim.cmd('colorscheme default')
  else
  print "Theme Loaded"
end

print('Theme has been set to '..theme)
