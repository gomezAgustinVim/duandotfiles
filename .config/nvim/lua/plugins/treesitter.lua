require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"css",
		"latex",
		"cpp",
		"html",
		"javascript",
		"typescript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"yaml",
	},
	highlight = {
		enable = true,
	},
})
