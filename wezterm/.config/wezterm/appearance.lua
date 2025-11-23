local wezterm = require 'wezterm'

local M = {}

function M.apply_to_config(config)
    config.enable_wayland = true
    config.max_fps = 120
    config.animation_fps = 120
    config.prefer_egl = true

    config.font = wezterm.font 'JetBrains Mono'
    config.font_size = 12
    config.color_scheme = 'Rosé Pine Moon (base16)'
    config.window_background_opacity = 1.0
    config.underline_position = -2
    config.underline_thickness = 2
    config.window_decorations = 'NONE'
    config.hide_tab_bar_if_only_one_tab = true
    config.window_padding = {
        left = 10,
        right = 10,
        top = 0,
        bottom = 0,
    }

    config.cursor_blink_ease_in = 'EaseOut'
    config.cursor_blink_ease_out = 'EaseOut'
    config.default_cursor_style = 'BlinkingBlock'
    config.cursor_blink_rate = 650

    config.enable_tab_bar = true
    config.use_fancy_tab_bar = true
    config.tab_max_width = 25
    config.show_tab_index_in_tab_bar = false
    config.switch_to_last_active_tab_when_closing_tab = true

    config.command_palette_fg_color = '#b4befe'
    config.command_palette_bg_color = '#11111b'
    config.command_palette_font_size = 12
    config.command_palette_rows = 25

    config.window_frame = {
        active_titlebar_bg = '#090909',
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

return M
