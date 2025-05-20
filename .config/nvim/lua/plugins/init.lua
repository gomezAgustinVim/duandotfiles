return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },

  -- Productivity
  {
    "vimwiki/vimwiki",
    init = function()
      -- Define file extensions to
      -- syntax mappings for Vimwiki
      vim.g.vimwiki_list = {
        {
          path = "~/.local/share/vimwiki",
          syntax = "markdown",
          ext = ".md",
        },
      }

      vim.g.vimwiki_ext2syntax = {
        [".md"] = "markdown",
        [".Rmd"] = "markdown",
        [".rmd"] = "markdown",
        [".markdown"] = "markdown",
        [".mdown"] = "markdown",
      }

      -- This will make sure vimwiki will only set the
      -- filetype of markdown files inside a wiki
      -- directory, rather than vim.globally.
      vim.g.vimwiki_global_ext = 0
    end,
  },

  -- Syntax Highlighting and Colors --
  "kovetskiy/sxhkd-vim",

  -- Junegunn Choi Plugins --
  "junegunn/vim-emoji",

  -- Other stuff --
  "frazrepo/vim-rainbow",

  "Saghen/blink.cmp",
}
