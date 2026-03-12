local wk = require("which-key")
wk.add({
	{ "zg", desc = "Añadir palabra a diccionario" },
	{ "zG", desc = "Añadir palabra a diccionario interno" },
	{ "zw", desc = "Marcar palabra como malonga nwn" },
	{ "z=", desc = "Ver sugerencia de palabras" },
	{ "g?", desc = "actions.show_help" }, -- oil bindings
	{ "C-x", desc = "Accept autocompletion suggestion" },
})
