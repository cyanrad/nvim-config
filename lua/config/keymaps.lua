-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

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
end)
vim.keymap.set("n", "<C-`>", function()
  vim.cmd("term")
end)

-- exiting terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- remapping for closing surrounds
vim.keymap.set("i", '"', '""<left>')
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
  map("n", "<M-" .. i .. ">", ":tabnext " .. i .. "<CR>", opts)
  map("i", "<M-" .. i .. ">", "<Esc>:tabnext " .. i .. "<CR>", opts) -- Also map in insert mode
end
