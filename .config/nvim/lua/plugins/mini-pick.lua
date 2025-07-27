require("mini.pick").setup({
	vim.keymap.set("n", "<leader>f", ":Pick files<CR>", { desc = "Pick Files" }),
	vim.keymap.set("n", "<leader>h", ":Pick help<CR>", { desc = "Pick help" }),
})
