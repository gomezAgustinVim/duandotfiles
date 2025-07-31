local A = vim.api
local C = vim.cmd

-- close nvim-tree if it's last buffer open
A.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        if #vim.api.nvim_list_bufs() == 1 and vim.bo.filetype == "NvimTree" then
            vim.cmd("quit")
        end
    end,
})

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

-- disable automatic comment on newline
A.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- Autoformat on save
A.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function(args)
        local clients = vim.lsp.get_clients({ bufnr = args.buf })
        if #clients > 0 then
            vim.lsp.buf.format({ async = false })
        end
    end,
})

-- Autoformat with conform if found
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf })
    end,
})

-- highlight text on yank
A.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ timeout = 300 })
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

-- linting when file is written to
A.nvim_create_autocmd("BufWritePost", {
    callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype, on write
        require("lint").try_lint()
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
