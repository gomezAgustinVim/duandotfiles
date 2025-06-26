-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local g = vim.g
local o = vim.o

-- Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
o.splitbelow = true
o.splitright = true

-- The following are commented out as they cause vim to behave a lot
-- differently from regular Vi. They are highly recommended though.
-- o.ic = true			-- Ignore case
o.showmatch = true -- Show matching brackets.
o.ignorecase = true -- Do case insensitive matching
o.smartcase = true -- Do smart case matching
o.incsearch = true -- Incremental search
o.hlsearch = false
o.autowrite = true -- Automatically save before commands like :next and :make
o.hidden = true -- Hide buffers when they are abandoned

-- Better editing experience
o.tabstop = 4 -- Tabs counts as 4 spaces
o.shiftwidth = 4
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.expandtab = true -- Turn tab into spaces
o.cindent = true
o.smartindent = true
o.autoindent = true
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true
o.wrap = true
o.textwidth = 300
o.list = true
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"

-- Better editor UI
o.numberwidth = 5
o.nu = true
o.relativenumber = true
o.cursorline = true
o.cursorlineopt = "both" -- to enable cursorline!

o.clipboard = "unnamedplus"
o.title = true
o.encoding = "utf-8"

-- Colors
o.termguicolors = true

-- Smooth scrolling
o.smoothscroll = true
o.scrolloff = 8
o.colorcolumn = "80"

-- Remember 50 items in commandline history
o.history = 50

-- Preserve view while jumping
o.jumpoptions = "view"

o.mouse = "a" -- Enable mouse usage (all modes)

-- Enable autocompletion:
o.wildmode = "longest,list,full"

o.updatetime = 50

-- Set global variables
-- g.hidden_all = 0

-- Set options
o.showmode = true
o.showcmd = true
o.ruler = true
o.laststatus = 2

-- Check if not running in a GUI
-- if not vim.fn.has("gui_running") then
--   o.t_Co = 256
-- end
