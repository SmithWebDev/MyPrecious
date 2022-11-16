local M = {}

M.plugin = {
  'chentoast/marks.nvim',

  config = function()
    require('marks').setup({
      default_mappings = true,
      signs = true,
    })
  end,
}

return M

-- Current Default Keymaps
-- mx              Set mark x
-- m,              Set the next available alphabetical (lowercase) mark
-- m;              Toggle the next available mark at the current line
-- dmx             Delete mark x
-- dm-             Delete all marks on the current line
-- dm<space>       Delete all marks in the current buffer
-- m]              Move to next mark
-- m[              Move to previous mark
-- m:              Preview mark. This will prompt you for a specific mark to
------------------ preview; press <cr> to preview the next mark.
-- m[0-9]          Add a bookmark from bookmark group[0-9].
-- m[0-9]          Delete all bookmarks from bookmark group[0-9].
-- m}              Move to the next bookmark having the same type as the bookmark under
--                 the cursor. Works across buffers.
-- m{              Move to the previous bookmark having the same type as the bookmark under
--                 the cursor. Works across buffers.
-- m=              Delete the bookmark under the cursor.


-- Highlights and Commands
-- ========================================
-- MarkSignHL                   The highlight group for displayed mark signs.
-- MarkSignNumHL                The highlight group for the number line in a signcolumn.
-- MarkVirtTextHL               The highlight group for bookmark virtual text annotations.
-- marks.nvim                   also defines the following commands:
-- :MarksToggleSigns[buffer]    Toggle signs globally. Also accepts an optional buffer number to toggle signs for that buffer only.
-- :MarksListBuf                Fill the location list with all marks in the current buffer.
-- :MarksListGlobal             Fill the location list with all global marks in open buffers.
-- :MarksListAll                Fill the location list with all marks in all open buffers.
-- :BookmarksList group_number  Fill the location list with all bookmarks of group "group_number".
-- :BookmarksListAll            Fill the location list with all bookmarks, across all groups.
