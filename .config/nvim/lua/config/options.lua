local options = {
	wildmenu = true,
	wildmode = "longest:full,full",
	redrawtime = 10000,
	maxmempattern = 20000,
	completeopt = { "menuone", "noselect", "noinsert" },

	winborder = "rounded",
	conceallevel = 0, -- markdown conceal
	concealcursor = "",
	showmode = false, -- Don't show mode since we have a statusline
	ruler = true, -- Disable extra numbering
	laststatus = 3, -- have a global statusline at the bottom instead of one for each window

	-- Better editing experience
	expandtab = true, -- Turn tab into spaces
	tabstop = 4, -- Tabs counts as 4 spaces
	softtabstop = -1, -- If negative, shiftwidth value is used
	shiftwidth = 4, -- 	Number of columns that make up one level of (auto)indentation
	showmatch = true, -- Show matching brackets.
	ignorecase = true, -- Do case insensitive matching
	smartcase = true, -- Do smart case matching
	hlsearch = true,
	incsearch = true, -- Incremental search
	cindent = true, -- C like indent
	autoindent = false, -- Indent with indent from last line value
	smarttab = false, -- Indent by shiftwidth value
	textwidth = 90,
	autoread = true, -- Automatically read file changed from outside
	autowrite = false, -- Automatically save before commands like :next and :make
	backspace = "indent,eol,start",
	autochdir = false,
	selection = "inclusive", -- include last char in selection

	-- backups
	hidden = true, -- Hide buffers when they are abandoned
	modifiable = true, -- Allow editing buffers
	swapfile = false, -- Do not use swap files
	backup = false,
	undodir = os.getenv("HOME") .. "/.vim/undodir",
	undofile = true,

	-- Better editor UI
	numberwidth = 5,
	number = true,
	relativenumber = true,
	cursorline = true,
	cursorlineopt = "both", -- to enable cursorline!
	clipboard = "unnamedplus", -- System clipboard integration
	title = true,
	encoding = "utf-8",
	wrap = false, -- do not wrap lines by default
	spell = false, -- do not spell check by default
	linebreak = false, -- wrap lines at preferred break points

	-- Smooth scrolling
	ttyfast = true,
	smoothscroll = true,
	scrolloff = 8,
	sidescrolloff = 8,

	-- Remember 5,0 items in commandline history
	history = 50,

	-- Preserve view while jumping
	jumpoptions = "view",

	mouse = "a", -- Enable mouse usage (all modes)

	updatetime = 300,
	timeoutlen = 500,

	spelllang = "es",

	-- folding for treesitter
	foldmethod = "expr", -- use expression based folding
	foldexpr = "v:lua.vim.treesitter.foldexpr()", -- use treesitter folding
	foldlevel = 99, -- start with all folds open

	splitbelow = true,
	splitright = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.path:append("**")
vim.opt.diffopt:append("linematch:60")
