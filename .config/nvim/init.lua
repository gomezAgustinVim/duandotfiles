vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.pack.add({
	{ src = "https://github.com/ellisonleao/gruvbox.nvim", name = "gruvbox" }, --colorscheme
	{ src = "https://github.com/vimwiki/vimwiki" }, -- vimwiki
	{ src = "https://github.com/norcalli/nvim-colorizer.lua" }, --color highlight
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" }, --render md inline
	{ src = "https://github.com/lewis6991/gitsigns.nvim" }, --git
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }, -- improved syntax
	{ src = "https://github.com/echasnovski/mini.pairs" }, -- autopairs
	{ src = "https://github.com/echasnovski/mini.surround" }, -- surround words with whatever
	{ src = "https://github.com/echasnovski/mini.completion" }, -- completion menu with snippets
	{ src = "https://github.com/echasnovski/mini.icons" }, -- Icons
	{ src = "https://github.com/stevearc/oil.nvim" }, -- Explorer with buffer like edit of directory structure
	{ src = "https://github.com/refractalize/oil-git-status.nvim" }, -- git changes on oil
	{ src = "https://github.com/goolord/alpha-nvim" }, --pretty startup
	{ src = "https://github.com/folke/which-key.nvim" }, --mappings popup
	{ src = "https://github.com/stevearc/conform.nvim" }, -- better formatter {}?
	{ src = "https://github.com/L3MON4D3/LuaSnip" }, -- more conventional snippets engine
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" }, -- manage files, buffers, git and grepper
})

-- move config and plugin config to alternate files
require("config.keymaps")
require("config.options")
require("config.autocmds")
require("core.lsp")

require("plugins.alpha")
require("plugins.colorizer")
require("plugins.gitsigns")
require("plugins.conform")
require("plugins.render-markdown")
require("plugins.vimwiki")
require("plugins.treesitter")
require("plugins.which-key")
require("plugins.luasnip")

require("fzf-lua").setup()

require("mini.completion").setup()
require("mini.pairs").setup(
	-- mappings = {
	--    add = 'sa', -- Add surrounding in Normal and Visual modes
	--    delete = 'sd', -- Delete surrounding
	--    find = 'sf', -- Find surrounding (to the right)
	--    find_left = 'sF', -- Find surrounding (to the left)
	--    highlight = 'sh', -- Highlight surrounding
	--    replace = 'sr', -- Replace surrounding
	--    update_n_lines = 'sn', -- Update `n_lines`
)
require("mini.surround").setup()

require("mini.icons").setup()

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

-- Theme related
require("gruvbox").setup({ transparent_mode = true })
require("ibl").setup()

vim.cmd("silent! colorscheme gruvbox")
vim.cmd(":hi statusline guibg=NONE")
