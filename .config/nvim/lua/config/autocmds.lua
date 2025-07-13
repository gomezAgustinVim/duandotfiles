-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local A = vim.api
local C = vim.cmd

-- Disable spell check for markdown files
A.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "FileType" }, {
  pattern = { "*.md", "markdown" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- numToStrs config

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
  end,
})

-- disable automatic comment on newline
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
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
