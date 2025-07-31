require("conform").setup({
	formatters_by_ft = {
		-- Conform will run the first available formatter
		lua = { "stylua" },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		markdown = { "prettier" },
		markdown_inline = { "prettier" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
