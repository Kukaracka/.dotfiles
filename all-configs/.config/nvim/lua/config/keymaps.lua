vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm direction=float<CR>")
vim.keymap.set("n", "<leader>е", "<cmd>ToggleTerm direction=float<CR>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

vim.keymap.set("n", "<leader>n", "<cmd>ASToggle<CR>", {})
vim.keymap.set("n", "<leader>т", "<cmd>ASToggle<CR>", {})

vim.keymap.set("n", "<C-q>", "<cmd>bdelete<CR>")
vim.keymap.set("n", "<C-й>", "<cmd>bdelete<CR>")

vim.keymap.set("n", "<C-e>", function() Snacks.explorer() end, { desc = "Toggle Explorer" })
vim.keymap.set("n", "<C-у>", function() Snacks.explorer() end, { desc = "Toggle Explorer" })

vim.keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit All" })
vim.keymap.set("n", "<leader>йй", "<cmd>qa<CR>", { desc = "Quit All" })
