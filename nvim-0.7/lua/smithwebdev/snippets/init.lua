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
--
--  lua = {
--    s("req", fmt("local {} = require('{}')", { i(1), rep(1)})),
--    s('keymap', fmt("{}noremap('{}',  '{}', {{ desc = '{}'}})", {i(1), i(2), i(3), i(4)})),
--    s('pcreate', fmt([[
--    local M = {{}}
--
--    M.plugin = {{
--      '{}',
--
--      config = function()
--        {}
--      end
--    }}
--
--    return M]],
--    {i(1), i(2)})),
--
--    --s("auc", fmt("vim.api.nvim_create_autocmd('{}')", i(1))),
--
--    --s('auc', fmt([[
--    --  vim.api.nvim_create_autocmd('{}', {
--    --    pattern = '{}',
--    --    command = '{}'{}
--    --    }), {i(1), i(2), i(3), c(4, sn(nil, fmt(",\n  group = {}"), i(0))), t""}]]))
--
--    s({
--      trig = 'auc',
--      name = 'Create Autocmd',
--      dscr = 'create autocmd with optional group tag',
--    }, fmt(
--    [[vim.api.nvim_create_autocmd('{}', {{
--      {},
--      {},
--      {}
--    }})]], 
--    {i(1, 'event'), c(2, {t"pattern = '{}'", t"command = '{}'", t"group = "}), c(3, {t"pattern = '{}'", t"command = '{}'", t'group = ', t''}), c(4,{ t'group = ', t''})}
--    )),
--
--    s('agroup', c(1, {
--      t'some text',
--      t("some other text"),
--      sn(nil, {i(1), t"some next text"})
--    }))
--  },
--  eruby = {
--    s({
--      trig = 'ltc',
--      name = 'Link to with class',
--      dscr = 'Link_to tag with added class option'
--    }, fmt(
--    [[link_to '{}', {}_path, class: '{}']],
--    {i(1), i(2), i(3)}))
--  },
})

print('snippets installed!')
