local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status then
  return
end

autopairs.setup({
  --check_ts = true,
  --ts_config = {
  --	lua = { "string" },
  --	javascript = { "template_string" },
  --	java = false,
  --},
  ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
  disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
  fast_wrap = {
    map = '<c-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = [=[[%'%"%>%]%)%}%,]]=],
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'Search',
    highlight_grey='Comment'
  },
})

-- If statement to ensure that Nvim-Autopairs doesnt interfere with
-- Navigation.lua plugin
if vim.o.ft == 'clap_input' and vim.o.ft == 'guihua' and vim.o.ft == 'guihua_rust' then
  require("cmp").setup.buffer { completion = { enable = false }}
end

local cmp_autopairs_status, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_status then
  return
end

local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
  return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
