local A = vim.api
local C = vim.cmd

A.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*.md", -- or "*.markdown" if you use that extension
	callback = function()
		vim.opt_local.spell = false
	end,
})

-- Custom filetypes
vim.filetype.add({
	extension = {
		conf = "conf",
		mdx = "markdown",
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

local num_au = A.nvim_create_augroup("NUMTOSTR", { clear = true })

-- Highlight the region on yank
A.nvim_create_autocmd("TextYankPost", {
	group = num_au,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual" })
		-- This is a workaround for clipboard not working in WSL
		-- see https://github.com/neovim/neovim/issues/19204#issuecomment-1173722375
		-- if vim.fn.has('wsl') == 1 then
		--     vim.fn.system('clip.exe', vim.fn.getreg('"'))
		-- end
	end,
})

-- Remove useless stuff from the terminal window and enter INSERT mode
A.nvim_create_autocmd("TermOpen", {
	group = num_au,
	callback = function(data)
		if not string.find(vim.bo[data.buf].filetype, "^[fF][tT]erm") then
			A.nvim_set_option_value("number", false, { scope = "local" })
			A.nvim_set_option_value("relativenumber", false, { scope = "local" })
			A.nvim_set_option_value("signcolumn", "no", { scope = "local" })
			A.nvim_command("startinsert")
		end
	end,
})

A.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})


------------------------------------------------------------------------------

-- luke smith's config

-- Set the 'filetype' when reading Xresources or Xdefaults files and
-- Run 'xrdb' after writing changes to Xresources or Xdefaults files
C([[
augroup XresourcesAndXdefaults
    autocmd!
    autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
    autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
augroup END
]])

-- Automatically deletes all trailing whitespace and newlines at end of file on save.
C([[
augroup deleteWhitespace
    autocmd!
	autocmd BufWritePre * %s/\s\+$//e
   	autocmd BufWritePre * %s/\n\+\%$//e
   	autocmd BufWritePre *.[ch] %s/\%$/\r/e
augroup END
]])
