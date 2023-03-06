local M = {}

M.plugin = {
  'L3MON4D3/LuaSnip',

  config = function()
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_snipmate').lazy_load()
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/smithwebdev/snippets" })
    local ls = require('luasnip')
    local types = require('luasnip.util.types')

    ls.config.set_config {
      history = true,
      updateevents = "TextChanged, TextChangedI",
      ext_base_prio = 200,
      ext_prio_increase = 1,
      enable_autosnippets = false,
      store_selection_keys = "<c-s>",
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { '<- Current Choice', 'NonTest' } },
          },
        },
      },
    }

    ls.filetype_extend("all", { "_" })
    ls.filetype_extend("eruby", { "html", "ruby" })
    ls.filetype_extend("ruby", { "eruby", 'rspec' })
    ls.filetype_extend("javascriptreact", { "javascript" })
    ls.filetype_extend("typescriptreact", { "javascript" })
    ls.filetype_extend("typescript", { "javascript" })
    ls.filetype_extend("javascript", { "javascriptreact" })
    ls.filetype_extend("vimwiki", { "markdown" })
    ls.filetype_extend("markdown", { "vimwiki" })



    -- keybinds
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

    vim.keymap.set("n", "<leader><leader>se", "<cmd>lua require('luasnip.loaders.from_lua').edit_snippet_files()<CR>")
    require('smithwebdev.snippets')
  end
}

return M
