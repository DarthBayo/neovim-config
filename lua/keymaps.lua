
vim.g.mapleader = '\\'

-----------------------------------------------------------
-- NORMAL KEYS
-----------------------------------------------------------
vim.keymap.set('n', '<leader>w', ':w<cr>')
vim.keymap.set('n', '<leader>q', ':q<cr>')
vim.keymap.set('n', '<Esc>', ':noh<cr>')

-----------------------------------------------------------
-- EXPLORE
-----------------------------------------------------------
vim.keymap.set('n', '<leader>ee', vim.cmd.Ex)
vim.keymap.set('n', '<leader>ev', vim.cmd.Ve)
vim.keymap.set('n', '<leader>eh', vim.cmd.He)
vim.keymap.set('n', '<leader>er', vim.cmd.Re)

