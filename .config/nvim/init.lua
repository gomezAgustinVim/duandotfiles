vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.pack.add({
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" }, --colorscheme
	{ src = "https://github.com/vimwiki/vimwiki" }, -- vimwiki
	{ src = "https://github.com/norcalli/nvim-colorizer.lua" }, --color highlight
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" }, --render md inline
	{ src = "https://github.com/lewis6991/gitsigns.nvim" }, --git
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }, -- improved syntax
	{ src = "https://github.com/echasnovski/mini.pairs" }, -- autopairs
	{ src = "https://github.com/echasnovski/mini.pick" }, -- File picker
	{ src = "https://github.com/echasnovski/mini.icons" }, -- Icons 2
	{ src = "https://github.com/echasnovski/mini.completion" }, -- completion menu with snippets
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- Icons
	{ src = "https://github.com/stevearc/oil.nvim" }, -- Explorer with buffer like edit of directory structure
	{ src = "https://github.com/refractalize/oil-git-status.nvim" }, -- git changes on oil
	{ src = "https://github.com/romgrk/barbar.nvim" },
	{ src = "https://github.com/goolord/alpha-nvim" }, --pretty startup
	{ src = "https://github.com/folke/which-key.nvim" }, --mappings popup
	{ src = "https://github.com/stevearc/conform.nvim" }, -- better formatter {}?
	{ src = "https://github.com/rafamadriz/friendly-snippets" }, -- snippets source
	{ src = "https://github.com/L3MON4D3/LuaSnip" }, -- more conventional snippets engine
	{ src = "https://github.com/mhinz/vim-grepper" },
	-- { src = "https://github.com/neovim/nvim-lspconfig" }, -- Native lsp
})

-- move config and plugin config to alternate files
require("config.keymaps")
require("config.options")
require("config.autocmds")
require("core.lsp")

require("plugins.alpha")
require("plugins.barbar")
require("plugins.colorizer")
require("plugins.gitsigns")
require("plugins.conform")
require("plugins.render-markdown")
require("plugins.vimwiki")
require("plugins.treesitter")
require("plugins.which-key")
require("plugins.luasnip")

require("mini.completion").setup()

require("mini.pairs").setup()

require("mini.pick").setup({
	vim.keymap.set("n", "<leader>f", ":Pick files<CR>", { desc = "Pick Files" }),
	vim.keymap.set("n", "<leader>h", ":Pick help<CR>", { desc = "Pick help" }),
})

require("oil").setup({
	vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open oil or parent directory" }),

	win_options = {
		signcolumn = "yes:2",
		wrap = false,
		cursorcolumn = false,
		foldcolumn = "0",
		spell = false,
		list = false,
		conceallevel = 3,
		concealcursor = "nvic",
	},
})

require("oil-git-status").setup()

vim.g.grepper = {
	tools = { "rg", "git" },
}

-- Theme related
require("gruvbox").setup({ transparent_mode = true })

vim.cmd("silent! colorscheme gruvbox")
vim.cmd(":hi statusline guibg=NONE")
