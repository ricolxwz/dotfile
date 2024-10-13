local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.color_scheme = "Batman"
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.colors = {
	background = "black",
}
config.macos_window_background_blur = 50
config.window_background_opacity = 0.8
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
return config
