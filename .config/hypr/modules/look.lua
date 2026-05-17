hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 10,

		border_size = 2,

		allow_tearing = false,

		-- Set to true enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = true,
		layout = "master",

		col = {
			active_border = { colors = { "rgb(5e81ac)", "rgba(2e3440ff)", "rgba(eceff4aa)" }, angle = 45 },
			inactive_border = { colors = { "rgb(d8dee9)" } },
		},
	},

	decoration = {
		rounding = 0,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 0.8,

		shadow = {
			enabled = false,
			-- range = 2,
			-- render_power = 3,
			-- color = { "rgba(1a1a1aee)" },
			-- offset = { 5, 5 },
			-- scale = 1.0,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.2,
		},
	},

	dwindle = {
		preserve_split = true, -- You probably want this
	},

	master = {
		new_status = "master",
	},
})

-- col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
-- col.inactive_border = rgba(595959aa)
