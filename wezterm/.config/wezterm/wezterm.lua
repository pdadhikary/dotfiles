local wezterm = require 'wezterm'
local appearance = require 'appearance'
local bindings = require 'bindings'

require('events.gui-startup').setup()
require('events.command-palette').setup()

local config = wezterm.config_builder()

appearance.apply_to_config(config)
bindings.apply_to_config(config)

wezterm.on('format-tab-title', function(tab)
    -- Get the process name.
    local process = string.gsub(tab.active_pane.foreground_process_name, '(.*[/\\])(.*)', '%2')

    -- Current working directory.
    local cwd = tab.active_pane.current_working_dir
    cwd = cwd and string.format('%s ', cwd.file_path:gsub(os.getenv 'HOME', '~')) or ''

    -- Format and return the title.
    return string.format('(%d %s) %s', tab.tab_index + 1, process, cwd)
end)

return config
