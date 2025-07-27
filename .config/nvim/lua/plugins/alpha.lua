local alpha = require('alpha')
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {

[[██████╗ ██╗   ██╗ █████╗ ███╗   ██╗████████╗██╗  ██╗███████╗██╗     ██╗███████╗███████╗]],
[[██╔══██╗██║   ██║██╔══██╗████╗  ██║╚══██╔══╝██║  ██║██╔════╝██║     ██║██╔════╝██╔════╝]],
[[██║  ██║██║   ██║███████║██╔██╗ ██║   ██║   ███████║█████╗  ██║     ██║█████╗  █████╗  ]],
[[██║  ██║██║   ██║██╔══██║██║╚██╗██║   ██║   ██╔══██║██╔══╝  ██║     ██║██╔══╝  ██╔══╝  ]],
[[██████╔╝╚██████╔╝██║  ██║██║ ╚████║   ██║   ██║  ██║███████╗███████╗██║██║     ███████╗]],
[[╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚═╝     ╚══════╝]],

}

dashboard.section.buttons.val = {
	dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("w", "󰯂  Vimwiki", ":VimwikiIndex <CR>"),
	dashboard.button("f", "󰍉  Find file", ":Pick files<CR>"),
	dashboard.button("e", "  Browse cwd", ":NvimTreeOpen<CR>"),
	-- dashboard.button("r", "  Browse src", ":e ~/.local/src/<CR>"),
	dashboard.button("s", "󰯂  Browse scripts", ":e ~/.local/bin/<CR>"),
	dashboard.button("c", "  Config", ":e ~/.config/nvim/<CR>"),
	dashboard.button("m", "  Mappings", ":e ~/.config/nvim/lua/config/keymaps.lua<CR>"),
	dashboard.button("p", "  Plugins", ":PlugInstall<CR>"),
	dashboard.button("q", "󰅙  Quit", ":q!<CR>"),
}

dashboard.section.footer.val = function()
  return vim.g.startup_time_ms or "[[ Los duanes venceremos NWN...  ]]"
end

dashboard.section.buttons.opts.hl = "Keyword"
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
