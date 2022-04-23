local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local date  = function() return { os.date('%Y-%m-%d') } end

ls.add_snippets(nil,{
  all = {
    s("ternary", {
      i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
    }),
    ls.parser.parse_snippet('expand', '-- this is what was expanded!')
  },

  lua = {
    s("req", fmt("local {} = require('{}')", { i(1), rep(1)})),
    s('keymap', fmt("{}noremap('{}',  '{}', {{ desc = '{}'}})", {i(1), i(2), i(3), i(4)})),
    s('pcreate', fmt([[
     local M = {{}}

     M.plugin = {{
       '{}',

       config = function()
         {}
       end
     }}

     return M]],
      {i(1), i(2)})),
    --s('auc', {
    --  t('vim.api.nvim_create_autocmd({ '),
    --  i(1),
    --  t(" '}, {"),
    --  t('\t'),
    --  i()
    --})
    --}),
    s('aug', fmt("vim.api.nvim_create_autogroup('{}', {{ clear = true }})", {i(1)})),
    s('auc', fmt([[
      vim.api.nvim_create_autocmd('{}', {{
        pattern = '{}',
        command = '{}',
        group = '{}'
      }})
    ]], {i(1), i(2), i(3), i(4)})),
  },
  eruby = {
    s({
      trig = 'ltc',
      name = 'Link to with class',
      dscr = 'Link_to tag with added class option'
    }, fmt(
        [[link_to '{}', {}_path, class: '{}']],
        {i(1), i(2), i(3)}))
  },
})

print('snippets installed!')
