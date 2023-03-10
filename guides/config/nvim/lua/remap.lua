
local builtin = require('telescope.builtin')

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Lexplore)

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})

vim.keymap.set('n', '<leader>q', "ZQ", {})


vim.keymap.set("n", "zq", "ZQ", { noremap = true })
vim.keymap.set("n", "G", "Gzz", { noremap = true })
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })
vim.keymap.set("n", "J", "<C-D>", { noremap = true })
vim.keymap.set("n", "K", "<C-U>", { noremap = true })
vim.keymap.set("n", "Y", "y$", { noremap = true })
vim.keymap.set("n", "*", "*N", { noremap = true })
vim.keymap.set("n", "\\", "/\\v", { noremap = true })
vim.keymap.set("n", "H", "^", { noremap = true })
vim.keymap.set("n", "L", "g$", { noremap = true })
vim.keymap.set("v", "H", "^", { noremap = true })
vim.keymap.set("v", "L", "g$", { noremap = true })

-- nav
vim.keymap.set("n", "<leader>h", "<C-W>h", { noremap = true })
vim.keymap.set("n", "<leader>j", "<C-W>j", { noremap = true })
vim.keymap.set("n", "<leader>k", "<C-W>k", { noremap = true })
vim.keymap.set("n", "<leader>l", "<C-W>l", { noremap = true })
vim.keymap.set("n", "<leader><", "<C-W>5<", { noremap = true })
vim.keymap.set("n", "<leader>>", "<C-W>5>", { noremap = true })



vim.keymap.set("i", "jj", "<Esc>:nohls<cr>", { noremap = true })

