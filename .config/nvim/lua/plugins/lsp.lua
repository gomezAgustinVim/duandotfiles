require("config.autocmds")

local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

vim.diagnostic.config({
	virtual_text = { prefix = "●", spacing = 4 },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
			[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
			[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true, -- "always"
		header = "",
		prefix = "",
		focusable = false,
		style = "minimal",
	},
})

local function lsp_on_attach(ev)
	local client = vim.lsp.get_client_by_id(ev.data.client_id)
	if not client then
		return
	end

	local bufnr = ev.buf
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format code" })
	vim.keymap.set("n", "<leader>li", ":checkhealth vim.lsp<CR>", { desc = "LSP server info" })
	vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>lk", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<leader>lD", vim.lsp.buf.definition, opts)

	if client:supports_method("textDocument/codeAction", bufnr) then
		vim.keymap.set("n", "<leader>oi", function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" }, diagnostics = {} },
				apply = true,
				bufnr = bufnr,
			})
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 50)
		end, opts)
	end
end

vim.api.nvim_create_autocmd("LspAttach", { group = augroup, callback = lsp_on_attach })

vim.keymap.set("n", "<leader>q", function()
	vim.diagnostic.setloclist({ open = true })
end, { desc = "Open diagnostic list" })

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config("ts_ls", {})
vim.lsp.config("bashls", {})
vim.lsp.config("tinymist", {})
vim.lsp.config("texlab", {})

vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"bashls",
	"tinymist",
	"elf",
	-- "gh_actions_ls",
	-- "terraformls",
	-- "ansiblels",
	-- "texlab",
})
