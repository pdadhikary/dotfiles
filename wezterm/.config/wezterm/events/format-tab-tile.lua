local wezterm = require 'wezterm'

local M = {}

M.setup = function ()
    wezterm.on('format-tab-title', function(tab)
        -- Get the process name.
        local process = string.gsub(tab.active_pane.foreground_process_name, '(.*[/\\])(.*)', '%2')

        -- Current working directory.
        local cwd = tab.active_pane.current_working_dir
        cwd = cwd and string.format('%s ', cwd.file_path:gsub(os.getenv 'HOME', '~')) or ''

        -- Format and return the title.
        return string.format('(%d %s) %s', tab.tab_index + 1, process, cwd)
    end)
end

return M
