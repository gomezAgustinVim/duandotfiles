---
--- https://github.com/luals/lua-language-server
---
--- Lua language server.
---
--- `lua-language-server` can be installed by following the instructions [here](https://luals.github.io/#neovim-install).
---
--- The default `cmd` assumes that the `lua-language-server` binary can be found in `$PATH`.
---
--- If you primarily use `lua-language-server` for Neovim, and want to provide completions,
--- analysis, and location handling for plugins on runtime path, you can use the following
--- settings.

vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
	runtime = {
		-- Tell the language server which version of Lua you're using (most
		-- likely LuaJIT in the case of Neovim)
		version = "LuaJIT",
		-- Tell the language server how to find Lua modules same way as Neovim
		-- (see `:h lua-module-load`)
	},
	diagnostics = {
		globals = {
			"vim",
			"require",
		},
	},
	-- Make the server aware of Neovim runtime files
	workspace = {
		library = {
			vim.env.VIMRUNTIME,
			vim.api.nvim_get_runtime_file("", true),
		},
	},
	telemetry = {
		enable = false,
	},
})
