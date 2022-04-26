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

return{
  parse('trig', 'loaded!'),
  s({
    trig = 'ltc',
    name = 'Link to with class',
    dscr = 'Link_to tag with added class option / optional delete action'
  }, fmt(
      [[<%= link_to '{}', {}_path{},{} class: '{}' %>]],
      {i(1), i(2), i(3), c(4,{t(''), t(' method: :delete,')}), i(5)})),
  s({
    trig = 'btc',
    name = 'Button to with class',
    dscr = 'Button_to tag with added class option / optional delete action'
  }, fmt(
      [[<%= button_to '{}', {}_path{},{} class: '{}' %>]],
      {i(1), i(2), i(3), c(4,{t(''), t(' method: :delete,')}), i(5)})),
  --s({
  --  trig = 'tft',
  --  name = 'turbo_frame_tag',
  --  dscr = 'Create turbo frame tag',
  --}, {
  --    t('<%= turbo_frame_tag '),
  --    i(1),
  --    t(' do %>'),
  --    t('\t'),
  --    f(function(_, snip)
  --      return snip.env.TM_SELECTED_TEXT[1] or {}
  --    end, {}),
  --    t('<% end %>'),
  --    i(0)
  --  }),
  s({
    trig = 'tft',
    name = 'turbo_frame_tag',
    dscr = 'Create turbo frame tag',
  }, {
      t('<%= turbo_frame_tag '),
      i(1),
      t(' do %>'),
      i(0)
    }),
  --s({
  --  trig = 'tstream',
  --  name = 'turbo stream',
  --  dscr = 'Inserts turbo stream tag with choice of methods'
  --}, {
  --    fmt(
  --      [[<%= turbo_stream{}.{} {} %>]],
  --      {c(1),{
  --        t('.'),
  --        t('_from.'),
  --        t()
  --      }},
  --      {c(2, {
  --        t('remove'),
  --        t('remove_all'),
  --        t('replace'),
  --        t('replace_all'),
  --        t('before'),
  --        t('before_all'),
  --        t('after'),
  --        t('after_all'),
  --        t('update'),
  --        t('update_all'),
  --        t('append'),
  --        t('append_all'),
  --        t('prepend'),
  --        t('prepend_all'),
  --        t('action'),
  --        t('action_all'),
  --      }), i(3)}

  --    )
  --  }),
},
print("eruby snippets attached")
