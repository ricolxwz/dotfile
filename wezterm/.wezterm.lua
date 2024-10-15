local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.color_scheme = "tokyonight"
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.font_size = 14.0
config.window_background_opacity = 1.0
-- config.macos_window_background_blur = 30
return config
