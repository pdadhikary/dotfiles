local wezterm = require 'wezterm'
local act = wezterm.action

local M = {}

local leader = { key = 'Space', mods = 'CTRL' }

local mod = {
    SUPER = 'ALT',
    SUPER_REV = 'ALT|CTRL',
    LEADER = 'LEADER',
}

local mouse_bindings = {
    {
        event = { Down = { streak = 3, button = 'Left' } },
        action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
        mods = 'NONE',
    },
    {
        event = { Down = { streak = 1, button = 'Right' } },
        mods = 'NONE',
        action = wezterm.action_callback(function(window, pane)
            local has_selection = window:get_selection_text_for_pane(pane) ~= ''
            if has_selection then
                window:perform_action(act.CopyTo 'ClipboardAndPrimarySelection', pane)
                window:perform_action(act.ClearSelection, pane)
            else
                window:perform_action(act { PasteFrom = 'Clipboard' }, pane)
            end
        end),
    },
}

local keys = {
    { key = 'F11', mods = 'NONE', action = act.ToggleFullScreen },
    { key = 'F12', mods = 'NONE', action = act.ShowDebugOverlay },
    { key = '`', mods = mod.SUPER, action = act.ActivateCommandPalette },
    { key = 't', mods = mod.SUPER, action = act.SpawnTab 'DefaultDomain' },
    {
        key = 'w',
        mods = mod.SUPER_REV,
        action = act.CloseCurrentTab { confirm = false },
    },
    {
        key = '[',
        mods = mod.SUPER,
        action = act.ActivateTabRelative(-1),
    },
    {
        key = ']',
        mods = mod.SUPER,
        action = act.ActivateTabRelative(1),
    },
    { key = '[', mods = mod.SUPER_REV, action = act.MoveTabRelative(-1) },
    {
        key = ']',
        mods = mod.SUPER_REV,
        action = act.MoveTabRelative(1),
    },
    {
        key = [[\]],
        mods = mod.SUPER,
        action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = [[\]],
        mods = mod.SUPER_REV,
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'k',
        mods = mod.SUPER_REV,
        action = act.ActivatePaneDirection 'Up',
    },
    {
        key = 'j',
        mods = mod.SUPER_REV,
        action = act.ActivatePaneDirection 'Down',
    },
    {
        key = 'h',
        mods = mod.SUPER_REV,
        action = act.ActivatePaneDirection 'Left',
    },
    {
        key = 'l',
        mods = mod.SUPER_REV,
        action = act.ActivatePaneDirection 'Right',
    },
    {
        key = 'w',
        mods = mod.SUPER,
        action = act.CloseCurrentPane { confirm = false },
    },
    {
        key = 'H',
        mods = mod.LEADER,
        action = act.AdjustPaneSize { 'Left', 5 },
    },
    {
        key = 'J',
        mods = mod.LEADER,
        action = act.AdjustPaneSize { 'Down', 5 },
    },
    { key = 'K', mods = mod.LEADER, action = act.AdjustPaneSize { 'Up', 5 } },
    {
        key = 'L',
        mods = mod.LEADER,
        action = act.AdjustPaneSize { 'Right', 5 },
    },
}

function M.apply_to_config(config)
    config.keys = keys
    config.leader = leader
    config.mouse_bindings = mouse_bindings
end

return M
