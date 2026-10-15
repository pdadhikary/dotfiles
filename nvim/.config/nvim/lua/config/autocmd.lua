vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { timeout = 200 }
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown', 'text' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'svelte', 'typescript', 'javascript', 'html', 'css', 'lua' }, -- whatever you use
  callback = function()
    vim.treesitter.start()
  end,
})

local group =
    vim.api.nvim_create_augroup('MacroNotifications', { clear = true })

vim.api.nvim_create_autocmd('RecordingEnter', {
    group = group,
    callback = function()
        vim.notify(
            'Recording macro @' .. vim.fn.reg_recording(),
            vim.log.levels.INFO,
            {
                title = 'Macro',
                timeout = false, -- stays until dismissed/replaced
            }
        )
    end,
})

vim.api.nvim_create_autocmd('RecordingLeave', {
    group = group,
    callback = function()
        vim.notify(
            'Recorded macro @' .. vim.fn.reg_recording(),
            vim.log.levels.INFO,
            {
                title = 'Macro',
                timeout = 1500,
            }
        )
    end,
})

-- Recover from a stale swap file (and delete it) instead of the default prompt.
local swap_recover = vim.api.nvim_create_augroup('SwapRecover', { clear = true })

local function recovery_reported_errors(before, after)
    -- :messages appends; only inspect what recovery added.
    if #after <= #before then
        return false
    end
    local new = after:sub(#before + 1)
    return new:find('E%d+') ~= nil or new:find('%?%?%?') ~= nil
end

vim.api.nvim_create_autocmd('SwapExists', {
    group = swap_recover,
    callback = function()
        -- nvim.swapfile (default autocmd, runs first) already handled live swaps.
        if vim.v.swapchoice ~= '' then
            return
        end

        local swapfile = vim.v.swapname
        local file = vim.fn.expand '<afile>'
        local buf = vim.api.nvim_get_current_buf()

        local choice = vim.fn.confirm(
            ('Swap file found:\n  %s\n\nRecover "%s" and delete the swap file?'):format(
                swapfile,
                file
            ),
            '&Recover\n&Edit anyway\n&Quit',
            1
        )

        if choice == 1 then
            local before = vim.fn.execute 'messages'
            vim.v.swapchoice = 'r'
            vim.api.nvim_create_autocmd('BufReadPost', {
                group = swap_recover,
                buffer = buf,
                once = true,
                callback = function()
                    vim.schedule(function()
                        local after = vim.fn.execute 'messages'
                        if recovery_reported_errors(before, after) then
                            vim.notify(
                                'Recovery reported errors; keeping swap file: ' .. swapfile,
                                vim.log.levels.WARN
                            )
                        elseif vim.fn.filereadable(swapfile) == 1 then
                            vim.fn.delete(swapfile)
                            vim.notify(
                                'Recovered and deleted swap file: ' .. swapfile,
                                vim.log.levels.INFO
                            )
                        end
                    end)
                end,
            })
        elseif choice == 3 or choice == 0 then
            vim.v.swapchoice = 'q'
        else
            vim.v.swapchoice = 'e'
        end
    end,
})
