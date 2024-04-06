vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<leader>sc', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
