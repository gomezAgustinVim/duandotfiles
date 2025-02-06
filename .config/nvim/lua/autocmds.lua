local A = vim.api
local C = vim.cmd

-- numToStrs config

-- Custom filetypes
vim.filetype.add {
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
}

local num_au = A.nvim_create_augroup("NUMTOSTR", { clear = true })

-- Highlight the region on yank
A.nvim_create_autocmd("TextYankPost", {
  group = num_au,
  callback = function()
    vim.highlight.on_yank { higroup = "Visual" }
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
      A.nvim_command "startinsert"
    end
  end,
})

-- Jump to the last place in the file before exiting
A.nvim_create_autocmd("BufReadPost", {
  group = num_au,
  callback = function(data)
    local last_pos = A.nvim_buf_get_mark(data.buf, '"')
    if last_pos[1] > 0 and last_pos[1] <= A.nvim_buf_line_count(data.buf) then
      A.nvim_win_set_cursor(0, last_pos)
    end
  end,
})

------------------------------------------------------------------------------

-- my config

-- Autocmd to run texclear script when leaving a .tex file
C [[
augroup CleanTeXBuildFiles
    autocmd!
    autocmd VimLeave *.tex !texclear %
augroup END
]]

C [[
cnoreabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
]]

-- Set the 'filetype' when reading Xresources or Xdefaults files and
-- Run 'xrdb' after writing changes to Xresources or Xdefaults files
C [[
augroup XresourcesAndXdefaults
    autocmd!
    autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
    autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
augroup END
]]

-- Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if vim.o.diff then
  C "highlight! link DiffText MatchParen"
end

-- Uncomment the following to have Vim load indentation rules and plugins
-- according to the detected filetype.
C "filetype plugin indent on"

-- Disables automatic commenting on newline:
C [[
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]]

-- Automatically deletes all trailing whitespace and newlines at end of file on save.
C [[
augroup deleteWhitespace
    autocmd!
	  autocmd BufWritePre * %s/\s\+$//e
   	autocmd BufWritePre * %s/\n\+\%$//e
   	autocmd BufWritePre *.[ch] %s/\%$/\r/e
augroup END
]]

-- Set filetypes based on patterns
C [[
    autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
    autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
    autocmd BufRead,BufNewFile *.tex set filetype=tex
]]

-- C('colorscheme base16-gruvbox-material-dark-hard')

-- C(autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE)

-- Recompile dwmblocks on config edit.
-- C([[
-- autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }
-- ]])
