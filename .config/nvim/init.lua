-- auto install vim-plug and plugins, if not found
local data_dir = vim.fn.stdpath("data")
if vim.fn.empty(vim.fn.glob(data_dir .. "/site/autoload/plug.vim")) == 1 then
    vim.cmd(
        "silent !curl -fLo "
        .. data_dir
        .. "/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    )
    vim.o.runtimepath = vim.o.runtimepath
    vim.cmd("autocmd VimEnter * PlugInstall --sync | source $MYVIMRC")
end

local Plug = vim.fn["plug#"]

vim.g.start_time = vim.fn.reltime()
vim.loader.enable()
vim.call("plug#begin")

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

Plug("ellisonleao/gruvbox.nvim", { ["as"] = "gruvbox" }) --colorscheme
Plug("catppuccin/nvim", { ["as"] = "catppuccin" })       --colorscheme 2
Plug("neovim/nvim-lspconfig")                            -- Native lsp
Plug("nvim-lualine/lualine.nvim")                        --statusline
Plug("vimwiki/vimwiki")                                  -- vimwiki
Plug("norcalli/nvim-colorizer.lua")                      --color highlight
Plug("MeanderingProgrammer/render-markdown.nvim")        --render md inline
Plug("lewis6991/gitsigns.nvim")                          --git
Plug("iamcco/markdown-preview.nvim")
Plug("nvim-treesitter/nvim-treesitter")                  -- improved syntax
Plug("echasnovski/mini.pairs")                           -- autopairs
Plug("echasnovski/mini.snippets")                        -- snippets engine
Plug("rafamadriz/friendly-snippets")                     -- snippets source
Plug("echasnovski/mini.pick")                            -- File picker
Plug("echasnovski/mini.icons")                           -- Icons 2
Plug('nvim-tree/nvim-web-devicons')                      -- Icons
Plug("nvim-tree/nvim-tree.lua")                          -- File explorer
Plug("romgrk/barbar.nvim")                               --bufferline
Plug("goolord/alpha-nvim")                               --pretty startup
-- Plug("L3MON4D3/LuaSnip")                                 -- more conventional snippets engine
-- Plug("Saghen/blink.compat")                              -- compatibility with nvim.cmp
-- Plug("Saghen/blink.cmp")                                 -- autocompletion
Plug("mfussenegger/nvim-lint") --async linter
Plug("folke/which-key.nvim")   --mappings popup
Plug("stevearc/conform.nvim")  -- better formatter (?
--- Not configured yet ---

vim.call("plug#end")

-- move config and plugin config to alternate files
require("config.keymaps")
require("config.options")
require("config.autocmds")
require("core.lsp")

require("plugins.alpha")
require("plugins.barbar")
require("plugins.colorizer")
require("plugins.colorscheme")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.conform")
require("plugins.nvim-lint")
require("plugins.mini-snippets")
-- require("plugins.blink")
-- require("plugins.luasnip")
require("plugins.render-markdown")
require("plugins.vimwiki")

vim.defer_fn(function()
    --defer non-essential configs,
    --purely for experimental purposes:
    --this only makes a difference of +-10ms on initial startup
    require("plugins.mini-pairs")
    require("plugins.treesitter")
    require("plugins.mini-pick")
    require("plugins.nvim-tree")
    require("plugins.which-key")
end, 100)
