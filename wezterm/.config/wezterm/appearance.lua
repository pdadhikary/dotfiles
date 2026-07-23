local wezterm = require 'wezterm'

local M = {}

function M.apply_to_config(config)
    config.enable_wayland = true
    config.max_fps = 165
    config.animation_fps = 165
    config.prefer_egl = true

    config.font = wezterm.font 'JetBrains Mono'
    config.font_size = 12
    config.color_scheme = 'Rosé Pine Moon (base16)'
    config.window_background_opacity = 1.0
    config.underline_position = -2
    config.underline_thickness = 2
    config.window_decorations = 'NONE'

    config.hide_tab_bar_if_only_one_tab = false
    config.tab_max_width = 25
    config.enable_tab_bar = true
    config.tab_bar_at_bottom = true
    config.show_tab_index_in_tab_bar = true
    config.switch_to_last_active_tab_when_closing_tab = true
    config.use_fancy_tab_bar = false
    config.tab_and_split_indices_are_zero_based = false

    config.window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    }
    config.inactive_pane_hsb = {
        saturation = 0.6,
        brightness = 0.6,
    }

    config.cursor_blink_ease_in = 'EaseOut'
    config.cursor_blink_ease_out = 'EaseOut'
    config.default_cursor_style = 'BlinkingBlock'
    config.cursor_blink_rate = 650

    config.command_palette_fg_color = '#b4befe'
    config.command_palette_bg_color = '#11111b'
    config.command_palette_font_size = 12
    config.command_palette_rows = 25

    config.window_frame = {
        border_left_width = '0.4cell',
        border_right_width = '0.4cell',
        border_bottom_height = '0.15cell',
        border_top_height = '0.15cell',
    }

    config.inactive_pane_hsb = {
        saturation = 1,
        brightness = 1,
    }

    config.visual_bell = {
        fade_in_function = 'EaseIn',
        fade_in_duration_ms = 250,
        fade_out_function = 'EaseOut',
        fade_out_duration_ms = 250,
        target = 'CursorColor',
    }
end

local function tab_title(tab_info)
    local title = tab_info.tab_title

    if title and #title > 0 then
        return title
    end

    return tab_info.active_pane.title
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local title = ' ' .. tab.tab_index + 1 .. ': ' .. tab_title(tab) .. ' '
    local left_edge_text = ''
    local right_edge_text = ''

    if tab.is_active then
        return {
            { Text = left_edge_text },
            { Text = title },
            { Text = right_edge_text },
        }
    end
end)

wezterm.on('trigger-renametab', function(window, pane)
    window:perform_action(
        wezterm.action.PromptInputLine {
            description = 'Enter new tab title',
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        },
        pane
    )
end)

return M
