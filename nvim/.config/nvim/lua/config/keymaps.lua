-- Clipboard keybindings
-- Copy selection to system clipboard in visual mode
vim.keymap.set('v', '<C-c>', '"+y', { desc = 'Copy selection to system clipboard' })
-- Copy entire line to system clipboard in normal mode
vim.keymap.set('n', '<C-c>', '"+yy', { desc = 'Copy line to system clipboard' })