return {
    {
        "stevearc/conform.nvim",
        event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim", "lua", "vimdoc",
                "html", "css"
            },
        },
    },

    -- Productivity
    {
        "vimwiki/vimwiki",
        init = function()
            -- Define file extensions to
            -- syntax mappings for Vimwiki
            vim.g.vimwiki_list = {
                {
                    path = '~/.local/share/vimwiki',
                    syntax = 'markdown',
                    ext = '.md',
                },
            }

            vim.g.vimwiki_ext2syntax = {
                ['.md'] = 'markdown',
                ['.Rmd'] = 'markdown',
                ['.rmd'] = 'markdown',
                ['.markdown'] = 'markdown',
                ['.mdown'] = 'markdown',
            }

            -- This will make sure vimwiki will only set the
            -- filetype of markdown files inside a wiki
            -- directory, rather than vim.globally.
            vim.g.vimwiki_global_ext = 0
        end,
    },

    "lukas-reineke/indent-blankline.nvim",
    "ryanoasis/vim-devicons",

    -- Syntax Highlighting and Colors --
    "PotatoesMaster/i3-vim-syntax",
    "kovetskiy/sxhkd-vim",
    "ap/vim-css-color",

    -- Junegunn Choi Plugins --
    "junegunn/vim-emoji",

}
