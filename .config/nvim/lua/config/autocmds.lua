-- Custom filetypes
vim.filetype.add({
	extension = {
		conf = "conf",
		mdx = "markdown",
		rmd = "markdown",
		Rmd = "markdown",
		mjml = "html",
		kicad_mod = "scheme",
	},
	pattern = {
		[".*%.env.*"] = "sh",
		["ignore$"] = "conf",
	},
	filename = {
		["yup.lock"] = "yaml",
	},
})

local num_au = vim.api.nvim_create_augroup("NUMTOSTR", { clear = true })

-- disable automatic comment on newline
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Autoformat on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		local clients = vim.lsp.get_clients({ bufnr = args.buf })
		if #clients > 0 then
			vim.lsp.buf.format({ async = false })
		end
	end,
})

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})

-- Remove useless stuff from the terminal window and enter INSERT mode
vim.api.nvim_create_autocmd("TermOpen", {
	group = num_au,
	callback = function(data)
		if not string.find(vim.bo[data.buf].filetype, "^[fF][tT]erm") then
			vim.api.nvim_set_option_value("number", false, { scope = "local" })
			vim.api.nvim_set_option_value("relativenumber", false, { scope = "local" })
			vim.api.nvim_set_option_value("signcolumn", "no", { scope = "local" })
			vim.api.nvim_command("startinsert")
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

-- Set the 'filetype' when reading Xresources or Xdefaults files and
local xdb_au = vim.api.nvim_create_augroup("XresourcesAndXdefaults", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = xdb_au,
	pattern = { "Xresources", "Xdefaults", "xdresources", "xdefaults" },
	callback = function()
		vim.bo.filetype = "xdefaults"
	end,
})

-- Run 'xrdb' after writing changes to Xresources or Xdefaults files
vim.api.nvim_create_autocmd("BufReadPost", {
	group = xdb_au,
	pattern = { "Xresources", "Xdefaults", "xdresources", "xdefaults" },
	callback = function()
		vim.fn.system("!xrdb " .. vim.fn.expand("%"))
	end,
})
