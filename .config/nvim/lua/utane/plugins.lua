local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])

packer.startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-file-browser.nvim")

	use("nvim-treesitter/nvim-treesitter", {run = 'TSUpdate'}) -- Treesitter Syntax Highlighting

	-- Productivity
	use("vimwiki/vimwiki")
    use 'sheerun/vim-polyglot'
    -- Lua
    use {
    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        }
    end
    }

use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}

use "lukas-reineke/indent-blankline.nvim"

	use {
	  'nvim-lualine/lualine.nvim',
	   requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

	-- File management --
	use("scrooloose/nerdtree")
	use("tiagofumo/vim-nerdtree-syntax-highlight")
    use ("nvim-tree/nvim-web-devicons")
	use("ryanoasis/vim-devicons")

	-- Tim Pope Plugins --
	use("tpope/vim-surround")

	-- Syntax Highlighting and Colors --
	use("PotatoesMaster/i3-vim-syntax")
	use("kovetskiy/sxhkd-vim")
	use("ap/vim-css-color")

	-- Junegunn Choi Plugins --
	use("junegunn/vim-emoji")

	-- Colorschemes --
	use("RRethy/nvim-base16")

	-- Other stuff --
	use("frazrepo/vim-rainbow")

    -- LSP usage
use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'saadparwaiz1/cmp_luasnip'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  }
}

	if packer_bootstrap then
		packer.sync()
	end
end)
