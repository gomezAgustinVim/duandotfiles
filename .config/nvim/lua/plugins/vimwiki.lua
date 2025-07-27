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
	[".mdx"] = "markdown",
}

vim.g.vimwiki_global_ext = 0 -- don't treat all md files as vimwiki
