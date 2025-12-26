vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
-- Easier copying and pasting from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', opts)
vim.keymap.set("n", "<leader>p", '"+p', opts)
vim.keymap.set("n", "<leader>P", '"+P', opts)
vim.keymap.set("v", "<leader>p", '"_d"+p', opts)
vim.keymap.set("v", "<leader>P", '"_d"+P', opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<C-i>", "<C-i>", opts) -- to restore jump forward
vim.keymap.set("n", "<leader>x", ":Bdelete!<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- better indent
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Split management
vim.keymap.set("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)
