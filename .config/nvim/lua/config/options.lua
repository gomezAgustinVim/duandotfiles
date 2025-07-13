-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local options = {
  conceallevel = 2, -- markdown conceal
  concealcursor = "nc",
  showmode = false, -- Don't show mode since we have a statusline
  showcmd = false,
  ruler = false, -- Disable extra numbering
  laststatus = 3,
  showmatch = true, -- Show matching brackets.
  ignorecase = true, -- Do case insensitive matching
  smartcase = true, -- Do smart case matching
  incsearch = true, -- Incremental search
  hlsearch = false,
  autowrite = true, -- Automatically save before commands like :next and :make
  hidden = true, -- Hide buffers when they are abandoned

  -- Better editing experience
  tabstop = 4, -- Tabs counts as 4 spaces
  shiftwidth = 4,
  softtabstop = -1, -- If negative, shiftwidth value is used
  expandtab = true, -- Turn tab into spaces
  cindent = true,
  autoindent = false,
  smarttab = true,
  swapfile = false,
  backup = false,
  undofile = true,
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  wrap = true,
  textwidth = 300,
  list = true,
  listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂",

  -- Better editor UI
  numberwidth = 5,
  nu = true,
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

vim.diagnostic.config({
  signs = false,
})
