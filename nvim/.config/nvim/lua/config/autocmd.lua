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
