local wk = require("which-key")
wk.add({
	{ "<leader>P", desc = "Install Plugins" },
	{ "<leader>f", desc = "Pick Files" },
	{ "<leader>h", desc = "Pick help" },
	{ "<C-x>o", desc = "(insertar) Activar menu de completado nativo" },
	{ "zg", desc = "Añadir palabra a diccionario" },
	{ "zG", desc = "Añadir palabra a diccionario interno" },
	{ "zw", desc = "Marcar palabra como malonga nwn" },
	{ "g?", desc = "actions.show_help" }, -- oil bindings
})
