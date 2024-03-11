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
config.macos_window_background_blur = 16
config.window_decorations = "RESIZE|MACOS_FORCE_DISABLE_SHADOW"
config.enable_tab_bar = false

-- NeoVim背景色を変更
local function basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end
wezterm.on('update-right-status', function(window, pane)
  local overrides = {}
  -- Figが有効だと正常に動作しないので、対策考え中
  local proc = basename(pane:get_foreground_process_name())
  if proc ~= nil then
    if proc == 'nvim' then
      overrides = { text_background_opacity = 0.6 }
    end
  end
  window:set_config_overrides(overrides)
end)

-- and finally, return the configuration to wezterm
return config
