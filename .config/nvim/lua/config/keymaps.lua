local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--Remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", ";", ":") -- enter command mode CMD

map("n", "<leader>re", ":so <CR>", { desc = "Recargar configuración", silent = true })

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
map("n", "<leader>xe", "<cmd>!chmod +x %<CR>", { desc = "Hacer archivo ejecutable" })

-- Quit neovim
map("n", "<C-Q>", "<CMD>q<CR>")

-- Save neovim
map("n", "<C-s>", "<CMD>w<CR>")

-- Save and quit neovim
map("n", "<C-z>", "<CMD>x<CR>")

------------------------------------------------
-- ==>   Splits
------------------------------------------------

-- Navigate buffers
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>") -- la S significa shift
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
map("n", "<A-0>", "<Cmd>BufferLast<CR>")
map("n", "<A-p>", "<Cmd>BufferPin<CR>")

-- Close and split
map("n", "<leader>q", ":BufferClose<CR>", { desc = "Cerrar buffer", silent = true })
map("n", "<leader>Q", ":BufferClose!<CR>", { desc = "Cerrar buffer forzosamente" })
map(
	"n",
	"<leader>qr",
	":BufferCloseBuffersRight<CR>",
	{ desc = "Cerrar todos los buffers a la derecha", silent = true }
)
map(
	"n",
	"<leader>ql",
	":BufferCloseBuffersLeft<CR>",
	{ desc = "Cerrar todos los buffers a la izquierda", silent = true }
)
map("n", "<leader>U", ":bufdo bd<CR>", { desc = "Cerrar todos los buffers" }) -- close all
map("n", "<leader>vs", ":vsplit<CR>:bnext<CR>", { desc = "Split y buffer" }) -- ver split + open next buffer
map("n", "<leader>ss", ":split<CR>:bnext<CR>", { desc = "Split horizontal y buffer" }) -- hor split + open next buffer

-- Shortcutting split navigation, saving a keypress:
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Make adjusting split sizes a bit more friendly
map("n", "<C-Left>", "<CMD>vertical resize -2<CR>")
map("n", "<C-Right>", "<CMD>vertical resize +2<CR>")
map("n", "<C-Up>", "<CMD>resize -2<CR>")
map("n", "<C-Down>", "<CMD>resize +2<CR>")

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
map("n", "<C-a>", "ggVG")

-- Spelling español
map("n", "es", ":setlocal spelllang=es<CR>", { desc = "Poner corrector en español" })

map("n", "en", ":setlocal spelllang=en<CR>", { desc = "Poner corrector en inglés" })

-- Lsp related bindings start with l
map("n", "<leader>ln", vim.lsp.buf.rename, { desc = "Renombrar variable" })

map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" })

map("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format code" })

map("n", "<leader>li", ":LspInfo<CR>", { desc = "Información sobre LSP" })

map("n", "K", vim.lsp.buf.hover, { desc = "Hover over" })

map("n", "<leader>lk", vim.lsp.buf.signature_help, { desc = "Signature help" })

-- diagnostics
map("n", "gK", function()
	local new_config = not vim.diagnostic.config().virtual_lines
	vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = "Lineas virtuales de diagnóstico" })

-- misc
map("n", "<leader>sa", ":%s//g<Left><Left>", { desc = "Reemplazar todo" }) -- replace all
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Nvim tree" })
map("n", "<leader>gg", ":Grepper<CR>", { desc = "Grepear palabra" })
map("n", "]q", ":cnext<CR>")
map("n", "[q", ":cprev<CR>")
map("n", "<leader>P", ":PlugInstall<CR>") --vim-plug
map({ "n", "v" }, "<leader>cr", "1z=", { desc = "Corregir spelling" })
