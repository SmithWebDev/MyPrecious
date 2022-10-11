local M = {}

vim.g.user_emmet_leader_key = '<leader>,'
vim.g.user_emmet_settings = {
  javascript = {
    attribute = {
      { ['for'] = 'htmlFor' },
      { ['class'] = 'className' }
    },
    javascript = { extends = 'jsx' },
    typescript = { extends = 'tsx' }
    -- ['erb'] = {
    --   {extends = 'html'}
    --   },
  }
}

vim.g.user_emmet_mode = 'inv'

M.plugin = {
  'mattn/emmet-vim',
}

return M
