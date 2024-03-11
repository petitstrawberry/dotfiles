-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Color scheme
config.color_scheme = 'iceberg-dark'

config.window_background_opacity = 0.8
config.macos_window_background_blur = 8
config.window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW"
config.enable_tab_bar = false

-- and finally, return the configuration to wezterm
return config
