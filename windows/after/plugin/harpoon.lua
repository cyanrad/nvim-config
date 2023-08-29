local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- f is for file
vim.keymap.set("n", "<leader>f", mark.add_file)
vim.keymap.set("n", "<C-f>", ui.toggle_quick_menu)

-- u,i,o,p are all next to eachother so it makes sense
vim.keymap.set("n", "<C-n>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-m>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-,>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-.>", function() ui.nav_file(4) end)
