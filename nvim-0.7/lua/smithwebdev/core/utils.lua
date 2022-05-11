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

return Util
