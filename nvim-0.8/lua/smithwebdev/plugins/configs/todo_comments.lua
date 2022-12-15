local M = {}

M.plugin = {
  'folke/todo-comments.nvim', -- https://github.com/folke/todo-comments.nvim

  -- PERF: fully optimised
  -- HACK: hmm, this looks a bit funky
  -- TODO: What else?
  -- NOTE: add a note
  -- FIX:  This needs fixing
  -- WARNING: ???

  config = function()
    require'todo-comments'.setup()

    local u = require 'smithwebdev.core.utils'
    local nnoremap = u.nnoremap
    local vnoremap = u.vnoremap

    -- local hack = {keywords = {'', ''}}
    -- local fix = {keywords = {'FIXME'}}
    -- local test = {keywords = {'',''}}

    nnoremap('<leader>fT', ':TodoTelescope<CR>', { desc = 'Todo Comments in Telescope'})
    nnoremap('<leader>fQ', ':TodoQuickFix<CR>', { desc = 'Todo Comments in QuickFixList'})

    nnoremap('[td', "function() require('todo-comments').jump_next() end", { desc = 'Previous todo comment'})
    nnoremap(']td', "function() require('todo-comments').jump_next() end", { desc = 'Previous todo comment'})
    --nnoremap('[tf', "function() require('todo-comments').jump_next(fix) end", { desc = 'Previous todo fix comment'})
    --nnoremap(']tf', "function() require('todo-comments').jump_next(fix) end", { desc = 'Previous todo fix comment'})
    --nnoremap('[th', "function() require('todo-comments').jump_next(hack) end", { desc = 'Previous todo hack comment'})
    --nnoremap(']th', "function() require('todo-comments').jump_next(hack) end", { desc = 'Previous todo hack comment'})
    --nnoremap('[tt', "function() require('todo-comments').jump_next(test) end", { desc = 'Previous todo test comment'})
    --nnoremap(']tt', "function() require('todo-comments').jump_next(test) end", { desc = 'Previous todo test comment'})



    -- vim.keymap.set("n", "]t", function()
    --   require("todo-comments").jump_next()
    -- end, { desc = "Next todo comment" })

    -- vim.keymap.set("n", "[t", function()
    --   require("todo-comments").jump_prev()
    -- end, { desc = "Previous todo comment" })

    -- -- You can also specify a list of valid jump keywords

    -- vim.keymap.set("n", "]t", function()
    --   require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
    -- end, { desc = "Next error/warning todo comment" })
  end
}

return M
