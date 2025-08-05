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
	},
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = false,
		keymaps = {
			init_selection = "gnn", -- set to `false` to disable one of the mappings
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
})
