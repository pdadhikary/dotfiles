local wezterm = require 'wezterm'
local appearance = require 'appearance'
local bindings = require 'bindings'

require('events.gui-startup').setup()
require('events.command-palette').setup()
require('events.format-tab-tile').setup()

local config = wezterm.config_builder()

appearance.apply_to_config(config)
bindings.apply_to_config(config)

local bar = wezterm.plugin.require 'https://github.com/adriankarlen/bar.wezterm'
bar.apply_to_config(config, {
    modules = {
        leader = {
            enabled = true,
            icon = utf8.char(0x1f30a),
            color = 2,
        },
        ssh = {
            enabled = true,
            icon = wezterm.nerdfonts.md_ssh,
            color = 5,
        },
    },
})

local smart_splits = wezterm.plugin.require 'https://github.com/mrjones2014/smart-splits.nvim'
smart_splits.apply_to_config(config, {
    direction_keys = { 'h', 'j', 'k', 'l' },
    modifiers = {
        move = 'ALT',
        resize = 'ALT|CTRL',
    },
    log_level = 'info',
})

return config
