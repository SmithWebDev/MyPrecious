local M = {}

M.plugin = {


  config = function()
    local u = require 'smithwebdev.core.utils'
    local nnoremap = u.nnoremap

    nnoremap('<leader><leader>rgGQLi', ':Generate graphql:install <CR>', { desc = 'Rails Generate GraphQL Install' })
    nnoremap('<leader><leader>rgGQLu',  '!rails graphql:schema:idl', { desc = 'Update GraphQL Schema'})

  end
}

return M
