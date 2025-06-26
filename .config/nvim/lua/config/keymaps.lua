-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

local opts = { silent = true }

--Remap space as leader key
map("", "<Space>", "<Nop>", opts)

map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<ESC>")

-- Mimic shell movements
map("i", "<C-E>", "<C-o>$")
map("i", "<C-A>", "<C-o>^")

-- God reveals himself
-- Thanks the Primeagen
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "J", "mzJ`z")

-- Quickly save the current buffer or all buffers
map("n", "<leader>w", "<CMD>update<CR>", opts)

map("n", "<leader>W", "<CMD>wall<CR>", opts)

-- Navigate buffers
-- map("n", "<S-l>", ":bnext<CR>", opts) -- la S significa shift

-- map("n", "<S-h>", ":bprevious<CR>", opts)

-- Quit neovim
map("n", "<C-Q>", "<CMD>q<CR>")

-- Save neovim
map("n", "<C-s>", "<CMD>w<CR>")

-- Save and quit neovim
map("n", "<C-z>", "<CMD>x<CR>")

-- Create new tab
map("n", "tn", "<CMD>tabnew<CR>", opts)

-- Close tab
map("n", "tc", "<CMD>tabclose<CR>", opts)

-- Get tabs
map("n", "tt", "<CMD>tabs<CR>", opts)

-- Shortcut to yank register
-- map({ "n", "x" }, "<leader>py", '"0p')

-- Vim tree
-- map("n", "<c-n>", "<CMD>NvimTreeToggle<CR>")

------------------------------------------------
-- ==>   Splits
------------------------------------------------

-- Shortcutting split navigation, saving a keypress:
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Make adjusting split sizes a bit more friendly
-- map("n", "<C-Left>", "<CMD>vertical resize -2<CR>", opts)
-- map("n", "<C-Right>", "<CMD>vertical resize +2<CR>", opts)
-- map("n", "<C-Up>", "<CMD>resize -2<CR>", opts)
-- map("n", "<C-Down>", "<CMD>resize +2<CR>", opts)

-- Change 2 split windows from vert to horiz or horiz to vert
map("n", "<Leader>th", "<C-w>t<C-w>H")
map("n", "<Leader>tk", "<C-w>t<C-w>K")

-- Replace ex mode with gq
map("n", "Q", "gq")

-- Check file in shellcheck:
-- map("n", "<leader>s", ":!clear && shellcheck -x %<CR>")

-- Compile document, be it groff/LaTeX/markdown/etc.
map("n", "<leader>c", ':w! | !compiler "<c-r>%"<CR>')

-- Compile slide with pandoc
map("n", "<leader>e", ":!pandoc % -t beamer -o %.pdf<CR>")

-- Perform dot commands over visual blocks:
map("x", ".", ":normal .<CR>")

-- Mapping to open VimwikiIndex
map("n", "<leader>ww", ":VimwikiIndex<CR>", { noremap = true })

-- Control all select
map("n", "<C-a>", "ggVG", opts)
