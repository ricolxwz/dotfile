local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.color_scheme = "Dracula"
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.font_size = 16.0
return config
