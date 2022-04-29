---@diagnostic disable: lowercase-global
ls = require("luasnip")
-- some shorthands...
s = ls.snippet
sn = ls.snippet_node
isn = ls.indent_snippet_node
t = ls.text_node
i = ls.insert_node
f = ls.function_node
c = ls.choice_node
d = ls.dynamic_node
r = ls.restore_node
l = require("luasnip.extras").lambda
rep = require("luasnip.extras").rep
p = require("luasnip.extras").partial
m = require("luasnip.extras").match
n = require("luasnip.extras").nonempty
dl = require("luasnip.extras").dynamic_lambda
fmt = require("luasnip.extras.fmt").fmt
fmta = require("luasnip.extras.fmt").fmta
types = require("luasnip.util.types")
conds = require("luasnip.extras.expand_conditions")

local date = function() return { os.date('%Y-%m-%d') } end

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup('Lua Snippets', { clear = true })
local file_pattern = "*.lua"

local function cs(trigger, modes, opts)
  local snippet = s(trigger, nodes)
  local target_table = snippets

  local pattern = file_pattern
  local keymaps = {}

  if opts~= nil then
    if opts.pattern then
      pattern = opts.pattern
    end

    if type(opts) == "string" then
      if opts == "auto" then
        target_table = autosnippets
      else
        table.insert(keymaps, { "i", opts })
      end
    end

    if opts ~= nil and type(opts) == "table" then
      for _, keymap in ipairs(opts) do
        if type(keymap) ==  "string" then
          table.insert(keymaps, { "i", keymap })
        else
          table.insert(keymaps, keymap)
        end
      end
    end


    if opts ~= "auto" then
      for _, keymap in ipairs(keymaps) do
        vim.api.nvim_crate_autocmd("BufEnter", {
          pattern = pattern,
          group = group,
          callback = function()
            vim.keymap.set(keymap[1], keymap[2], function()
              ls.snip_expand(snippet)
            end, { noremap = true, silent = true, buffer = true })
          end,
        })
      end
    end
  end

  table.insert(target_table, snippet)
end


print('snippets dir accessed!')
