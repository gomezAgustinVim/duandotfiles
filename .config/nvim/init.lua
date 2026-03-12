vim.pack.add({
	{ src = "https://github.com/ellisonleao/gruvbox.nvim", name = "gruvbox" }, --colorscheme
	{ src = "https://github.com/vimwiki/vimwiki" }, -- vimwiki
	{ src = "https://github.com/norcalli/nvim-colorizer.lua" }, --color highlight
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" }, --render md inline
	{ src = "https://github.com/lewis6991/gitsigns.nvim" }, --git
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }, -- improved syntax
	{ src = "https://github.com/nvimtools/none-ls.nvim" }, -- linter
	{ src = "https://github.com/nvim-lua/plenary.nvim" }, -- dependency for linter
	{ src = "https://github.com/echasnovski/mini.pairs" }, -- autopairs
	{ src = "https://github.com/echasnovski/mini.surround" }, -- surround words with whatever
	{ src = "https://github.com/echasnovski/mini.completion" }, -- completion menu with snippets
	{ src = "https://github.com/echasnovski/mini.icons" }, -- Icons
	{ src = "https://github.com/stevearc/oil.nvim" }, -- Explorer with buffer like edit of directory structure
	{ src = "https://github.com/refractalize/oil-git-status.nvim" }, -- git changes on oil
	{ src = "https://github.com/goolord/alpha-nvim" }, --pretty startup
	{ src = "https://github.com/folke/which-key.nvim" }, --mappings popup
	{ src = "https://github.com/L3MON4D3/LuaSnip" }, -- more conventional snippets engine
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" }, -- self explanatory
	{ src = "https://github.com/ibhagwan/fzf-lua" }, -- manage files, buffers, git and grepper
	{ src = "https://github.com/mason-org/mason.nvim" }, -- look for lsps and formatters in one place
	{ src = "https://github.com/supermaven-inc/supermaven-nvim" }, -- super useful AI
	-- { src = "https://github.com/neovim/nvim-lspconfig" },
})

-- move config and plugin config to alternate files
require("config.keymaps")
require("config.options")
require("config.autocmds")
require("core.lsp")

require("plugins.alpha")
require("plugins.colorizer")
require("plugins.gitsigns")
require("plugins.render-markdown")
require("plugins.vimwiki")
require("plugins.treesitter")
require("plugins.which-key")
require("plugins.luasnip")

require("fzf-lua").setup({
	lsp = {
		async_or_timeout = 3000,
	},
})

require("mini.completion").setup()
require("mini.pairs").setup()
require("mini.surround").setup()

require("mini.icons").setup()

require("oil").setup({
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

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("supermaven-nvim").setup({
	keymaps = {
		accept_suggestion = "<S-Tab>",
		clear_suggestion = "<C-]>",
		accept_word = "<C-w>",
	},
	ignore_filetypes = { cpp = true, markdown = true },
	color = {
		suggestion_color = "#008282", -- color for the suggestion text
		cterm = 244,
	},
	log_level = "off", -- set to "off" to disable logging completely
	disable_inline_completion = false, -- disables inline completion for use with cmp
	disable_keymaps = false, -- disables built in keymaps for more manual control
	condition = function()
		return false
	end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
})

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.completion.spell,
		null_ls.builtins.completion.luasnip,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.refactoring,
	},
})

vim.cmd("silent! colorscheme gruvbox")
vim.cmd(":hi statusline guibg=NONE")
