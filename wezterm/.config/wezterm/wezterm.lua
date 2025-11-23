local wezterm = require 'wezterm'
local appearance = require 'appearance'
local bindings = require 'bindings'

require('events.gui-startup').setup()
require('events.command-palette').setup()

local config = wezterm.config_builder()

appearance.apply_to_config(config)
bindings.apply_to_config(config)

return config
