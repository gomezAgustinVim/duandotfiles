local map = vim.keymap.set

local opts = { noremap = true, silent = true }

--Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>re", ":source %<CR>", { desc = "Reload configuration" })

-- Mimic shell movements
map("i", "<C-E>", "<C-o>$")
map("i", "<C-A>", "<C-o>^")

-- God reveals himself
-- Thanks the Primeagen
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Make file executable
map("n", "<leader>xe", "<cmd>!chmod +x %<CR>", { desc = "Make file executable" })

-- Quit neovim
map("n", "<C-Q>", "<CMD>q<CR>")

-- Save neovim
map("n", "<C-s>", "<CMD>w<CR>")

-- Save and quit neovim
map("n", "<C-z>", "<CMD>x<CR>")

-- Tabs
-- Deactivate for now
-- map("n", "<leader>te", ":tabnew", opts)       -- Create new tab
-- map("n", "<tab>", ":tabnext<Return>", opts)   -- Close tab
-- map("n", "<s-tab>", ":tabprev<Return>", opts) -- Get tabs

------------------------------------------------
-- ==>   Splits
------------------------------------------------

-- Navigate buffers
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts) -- la S significa shift
map("n", "<leader>q", ":BufferClose<CR>", { desc = "Close buffer" })
map("n", "<leader>Q", ":BufferClose!<CR>", { desc = "Force close buffer" })
map("n", "<leader>U", "::bufdo bd<CR>", { desc = "Close all buffers" })                  -- close all
map("n", "<leader>vs", ":vsplit<CR>:bnext<CR>", { desc = "Split and buffer" })           -- ver split + open next buffer
map("n", "<leader>ss", ":split<CR>:bnext<CR>", { desc = "Horizontal split and buffer" }) -- hor split + open next buffer

-- Shortcutting split navigation, saving a keypress:
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Make adjusting split sizes a bit more friendly
map("n", "<C-Left>", "<CMD>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<CMD>vertical resize +2<CR>", opts)
map("n", "<C-Up>", "<CMD>resize -2<CR>", opts)
map("n", "<C-Down>", "<CMD>resize +2<CR>", opts)

-- Change 2 split windows from vert to horiz or horiz to vert
map("n", "<Leader>th", "<C-w>t<C-w>H", { desc = "Move split window to horizontal" })
map("n", "<Leader>tk", "<C-w>t<C-w>K", { desc = "Move split window to vertical" })

-- Replace ex mode with gq
map("n", "Q", "gq")

-- Compile document, be it groff/LaTeX/markdown/etc.
map("n", "<leader>cp", ':w! | !compiler "<c-r>%"<CR>', { desc = "Compile this file" })

-- Perform dot commands over visual blocks:
map("x", ".", ":normal .<CR>")

-- Mapping to open VimwikiIndex
map("n", "<leader>ww", ":VimwikiIndex<CR>", opts)

-- Control all select
map("n", "<C-a>", "ggVG", opts)

map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename variable" })

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

map("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format code" })

-- misc
map("n", "<leader>s", ":%s//g<Left><Left>", { desc = "Replace all" }) --replace all
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Open nvim tree" })
map("n", "<leader>P", ":PlugInstall<CR>")                             --vim-plug
