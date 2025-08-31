local options = {
	completeopt = { "menuone", "noselect", "popup" },
	winborder = "rounded",
	conceallevel = 2, -- markdown conceal
	concealcursor = "nc",
	showmode = false, -- Don't show mode since we have a statusline
	showcmd = false,
	ruler = true, -- Disable extra numbering
	laststatus = 3, -- have a global statusline at the bottom instead of one for each window
	showmatch = true, -- Show matching brackets.
	ignorecase = true, -- Do case insensitive matching
	smartcase = true, -- Do smart case matching
	hlsearch = true,
	incsearch = true, -- Incremental search
	autowrite = true, -- Automatically save before commands like :next and :make
	hidden = true, -- Hide buffers when they are abandoned

	-- Better editing experience
	expandtab = true, -- Turn tab into spaces
	tabstop = 4, -- Tabs counts as 4 spaces
	softtabstop = -1, -- If negative, shiftwidth value is used
	shiftwidth = 4, -- 	Number of columns that make up one level of (auto)indentation
	cindent = true, -- C like indent
	autoindent = false, -- Indent with indent from last line value
	smarttab = false, -- Indent by shiftwidth value
	swapfile = false, -- Do not use swap files
	backup = false,
	undofile = true,
	undodir = os.getenv("HOME") .. "/.vim/undodir",
	textwidth = 300,

	-- Better editor UI
	numberwidth = 5,
	number = true,
	relativenumber = true,
	cursorline = true,
	cursorlineopt = "both", -- to enable cursorline!
	clipboard = "unnamedplus", -- System clipboard integration
	title = true,
	encoding = "utf-8",

	-- Colors
	termguicolors = true,

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

	-- Enable autocompletion:
	wildmode = "longest,list,full",

	updatetime = 50,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
