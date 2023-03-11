local ls = require('luasnip')
local types = require('luasnip.util.types')


ls.config.set_config {
  history = true,
  updateevents = "TextChanged, TextChangedI",
  ext_base_prio = 200,
  ext_prio_increase = 1,
  enable_autosnippets = true,
  store_selection_keys = "<c-s>",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "●", "#ff0000" } }, -- { '<- Current Choice', 'NonTest' }
      },
    },
  },
}

require('luasnip.loaders.from_vscode').lazy_load()
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/smithwebdev/snippets/" })

--[[ keybinds ]]
                 --
--------------------------------------------------------------------------------
vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)
vim.keymap.set({ "i", "s" }, "<C-h>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end)

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(1) then
    ls.expand_or_jump()
  end
end)
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end)

vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]])
vim.keymap.set("n", "<leader><leader>se", ":LuaSnipEdit<CR>")
vim.keymap.set({ "i", "s" }, "<c-u>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>')
