local wezterm = require 'wezterm'
local act = wezterm.action

local M = {}

M.setup = function()
    wezterm.on('augment-command-palette', function(window, pane)
        return {
            {
                brief = 'Rename tab',
                icon = 'md_rename_box',

                action = act.PromptInputLine {
                    description = 'Enter new name for tab',
                    initial_value = 'My Tab Name',
                    action = wezterm.action_callback(function(window, pane, line)
                        if line then
                            window:active_tab():set_title(line)
                        end
                    end),
                },
            },
        }
    end)
end

return M
