
vim.g.mapleader = '\\'

-----------------------------------------------------------
-- Normal keys
-----------------------------------------------------------
vim.keymap.set('n', '<leader>w', ':w<cr>')
vim.keymap.set('n', '<leader>q', ':q<cr>')

-----------------------------------------------------------
-- EXPLORE
-----------------------------------------------------------
vim.keymap.set('n', '<leader>ee', vim.cmd.Ex)
vim.keymap.set('n', '<leader>ev', vim.cmd.Ve)
vim.keymap.set('n', '<leader>eh', vim.cmd.He)
vim.keymap.set('n', '<leader>er', vim.cmd.Re)

-----------------------------------------------------------
-- TELESCOPE SHORTCUTS
-----------------------------------------------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
