---[[---------------------------------------]]---
--                 SmithWebDev                 --
--                  Utilities                  --
---[[---------------------------------------]]---

_G.Util = {}

P = function(...)
  local args = { ... }

  for _,v in ipairs(args) do
    print(vim.inspect(v))
  end

  return args
end

Util.get_word = function()
  local fn = vim.fn
  local first_line, last_line = fn.getpos("'<")[2], fn.getpos("'>")[2]
  local first_col, last_col = fn.getpos("'<")[3], fn.getpos("'>")[3]
  return fn.getline(first_line, last_line)[1]:sub(first_col, last_col)
end

-- Allows for Vim like Keybind syntax --

local get_mapper = function(mode, noremap)
  return function(lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = noremap
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

Util.noremap = get_mapper("n", false)
Util.nnoremap = get_mapper("n", true)
Util.cnoremap = get_mapper("c", true)
Util.inoremap = get_mapper("i", true)
Util.tnoremap = get_mapper("t", true)
Util.vnoremap = get_mapper("v", true)

-- Allows to exit from within code blocks

function EscapePair()
    local closers = {")", "]", "}", ">", "'", "\"", "`", ","}
    local line = vim.api.nvim_get_current_line()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local after = line:sub(col + 1, -1)
    local closer_col = #after + 1
    local closer_i = nil
    for i, closer in ipairs(closers) do
        local cur_index, _ = after:find(closer)
        if cur_index and (cur_index < closer_col) then
            closer_col = cur_index
            closer_i = i
        end
    end
    if closer_i then
        vim.api.nvim_win_set_cursor(0, {row, col + closer_col})
    else
        vim.api.nvim_win_set_cursor(0, {row, col + 1})
    end
end

Util.trigger_completion = function()
  local fn = vim.fn
  --if fn.pumvisible() ~= 0 and fn.complete_info()["selected"] ~= -1 then
  --  local e = core.menu:get_selected_entry() or (core.menu:get_first_entry())
  --  core.confirm(e, {
  --    behavior = cmp.ConfirmBehavior.Replace,
  --  }, function()
  --    core.complete(
  --      core.get_context { reason = types.cmp.ContextReason.TriggerOnly }
  --    )
  --  end)
  --  return
  --end

  local prev_col, next_col = fn.col "." - 1, fn.col "."
  local prev_char = fn.getline("."):sub(prev_col, prev_col)
  local next_char = fn.getline("."):sub(next_col, next_col)

  -- minimal autopairs-like behaviour
  if prev_char == "{" and next_char ~= "}" then return Util.t "<CR>}<C-o>O" end
  if prev_char == "[" and next_char ~= "]" then return Util.t "<CR>]<C-o>O" end
  if prev_char == "(" and next_char ~= ")" then return Util.t "<CR>)<C-o>O" end
  if prev_char == ">" and next_char == "<" then return Util.t "<CR><C-o>O" end -- html indents
  if prev_char == "(" and next_char == ")" then return Util.t "<CR><C-o>O" end -- flutter indents

  return Util.t "<CR>"
end
return Util
