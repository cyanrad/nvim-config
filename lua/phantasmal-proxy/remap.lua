vim.g.mapleader = " "

-- going back to file explorer
vim.keymap.set("n", "<leader>p", vim.cmd.Ex)

-- visual highlighted text movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- easy system clipboard copy
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- cursor stays put when <J>
vim.keymap.set("n", "J", "mzJ`z")

-- center screen at D/U and searching movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- deleting to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>D", [["_D]])

-- creating a tab
vim.keymap.set("n", "<C-t>", function()
    vim.cmd("tabnew tab")
    vim.cmd("Ex")
end)
vim.keymap.set("n", "<C-`>", function()
    vim.cmd("tabnew tab")
    vim.cmd("term")
end)

-- moving between them
vim.keymap.set("n", "<A-L>", "gt")
vim.keymap.set("n", "<A-H>", "gT")

-- exiting terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- moving between split screens
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

-- remapping alternate file because ^ is not working for me
vim.keymap.set("n", "<C-p>", "<C-^>")

-- remapping for closing surrounds
vim.keymap.set("i", "\"", "\"\"<left>")
vim.keymap.set("i", "'", "''<left>")
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "[", "[]<left>")
vim.keymap.set("i", "{", "{}<left>")
vim.keymap.set("i", "{<CR>", "{<CR>}<ESC>O")
vim.keymap.set("i", "{;<CR>", "{<CR>};<ESC>O")

-- Absolute tab mapping
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Map Alt + number to switch to the corresponding tab
for i = 1, 9 do
    map('n', '<M-' .. i .. '>', ':tabnext ' .. i .. '<CR>', opts)
    map('i', '<M-' .. i .. '>', '<Esc>:tabnext ' .. i .. '<CR>', opts) -- Also map in insert mode
end
