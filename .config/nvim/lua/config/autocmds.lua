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
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	callback = function(args)
-- 		local clients = vim.lsp.get_clients({ bufnr = args.buf })
-- 		if #clients > 0 then
-- 			vim.lsp.buf.format({ async = false })
-- 		end
-- 	end,
-- })

-- Autoformat on save (none-ls)
local fmt_au = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
require("null-ls").setup({
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = fmt_au, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = fmt_au,
                buffer = bufnr,
                filter = function(client)
                    -- apply whatever logic you want (in this example, we'll only use null-ls)
                    return client.name == "null-ls"
                end,
                callback = function()
                    vim.lsp.buf.formatting_sync()
                end,
            })
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

------------------------------------------------------------------------------

-- luke smith's config

-- Set the 'filetype' when reading Xresources or Xdefaults files and
-- Run 'xrdb' after writing changes to Xresources or Xdefaults files
vim.cmd([[
augroup XresourcesAndXdefaults
    autocmd!
    autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
    autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
augroup END
]])

-- Automatically deletes all trailing whitespace and newlines at end of file on save.
vim.cmd([[
augroup deleteWhitespace
    autocmd!
	autocmd BufWritePre * %s/\s\+$//e
   	autocmd BufWritePre * %s/\n\+\%$//e
   	autocmd BufWritePre *.[ch] %s/\%$/\r/e
augroup END
]])
