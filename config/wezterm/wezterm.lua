local wezterm = require("wezterm")

local cs = require("color_scheme")

local config = {
	background = {},

	font_size = 15,

	line_height = 1.1,
	font = wezterm.font_with_fallback({
		"CommitMono Nerd Font",
		{ family = "Symbols Nerd Font Mono" },
	}),

	window_padding = {
		left = 40,
		right = 20,
		top = 30,
		bottom = 20,
	},

	set_environment_variables = {
		BAT_THEME = "Catppuccin Mocha",
	},

	adjust_window_size_when_changing_font_size = false,
	debug_key_events = false,
	enable_tab_bar = false,
	native_macos_fullscreen_mode = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",

	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,
}

cs.apply_to_config(config)

return config
