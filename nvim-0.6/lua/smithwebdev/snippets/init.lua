local ls       = require'luasnip'

-- snippet variables --
local snip     = ls.snippet
local node     = ls.snippet_node
local text     = ls.text_node
local insert   = ls.insert_node
local func     = ls.function_node
local choice   = ls.choice_node
local dynamicn = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt

ls.config.set_config {
  history = true,
  updateevents = "TextChanged, TextChangedI",
  ext_base_prio = 200,
  ext_prio_increase = 1,
  enable_autosnippets = false,
  store_selection_keys = "<c-s>",
}

local date = function()
  return { os.date "%Y-%m-%d" }
end

ls.snippet = {
  lua = {
    node( 'req', fmt([[local {} = require "{}"]],
      { func(function(import_name) 
        return import_name[1]
      end, {1}), insert(1) }
      )
    ),
    -- Available in any filetype
    ls.parser.parse_snippet("expand", "--this is what was expanded!"),
    ls.parser.parse_snippet("lf", "local $1 = function($2)\n  $0\nend")
  },
}

