local lsp = vim.lsp.buf

-- Selections a code action available at the current cursor position.
lsp.code_action()

-- Retrieves the completion items at the current cursor position. Can only be
-- called in Insert mode.
lsp.completion()

-- Jumps to the declaration of the symbol under the cursor.
lsp.declaration()

-- Jumps to the definition of the symbol under the cursor.
lsp.definition()

-- Lists all the references to the symbol under cursor in the quickfix window
lsp.references()

-- Renames all references to the symbol under the cursor
lsp.rename()

-- Displays signature information about the symbol under the cursor in a
-- floating window
lsp.signature_help()

-- Jumps to the definition of the type of the symbol under the cursor
lsp.type_definition()



