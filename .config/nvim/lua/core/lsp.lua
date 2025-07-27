local signs = {
    Error = "󰅚 ",
    Warn = "󰀪 ",
    Hint = "󰌶 ",
    Info = "󰋽 ",
}

vim.lsp.enable({
    "lua_ls",
    "biome",
    "bashls",
    "pyright",
})

vim.lsp.config("*", {
	capabilities = {
		require("blink-cmp").get_lsp_capabilities(),
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
		},
	},
	root_markers = { ".git" },
})

vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = signs.Error,
            [vim.diagnostic.severity.WARN] = signs.Warn,
            [vim.diagnostic.severity.HINT] = signs.Hint,
            [vim.diagnostic.severity.INFO] = signs.Info,
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})

vim.cmd("set completeopt+=noselect")
