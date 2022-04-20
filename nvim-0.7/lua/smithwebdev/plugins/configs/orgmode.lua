local M = {}

M.plugin = {
  'nvim-orgmode/orgmode', -- https://github.com/nvim-orgmode/orgmode

  config = function()
    local orgmode = require("orgmode")

    orgmode.setup_ts_grammar()

    orgmode.setup({
      org_agenda_files = {},
      org_default_notes_file = '',
    })
  end
}

return M
