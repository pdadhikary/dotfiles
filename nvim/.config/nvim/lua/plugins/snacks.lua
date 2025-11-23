return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        animate = {
            enabled = true,
            duration = 20, -- ms per step
            easing = 'linear',
            fps = 120, -- frames per second. Global setting for all animations
        },
        bigfile = { enabled = true },
        dashboard = {
            preset = {
                pick = function(cmd, opts)
                    return LazyVim.pick(cmd, opts)()
                end,
                header = [[
████████▄     ▄████████    ▄████████    ▄███████▄  ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄
███   ▀███   ███    ███   ███    ███   ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄
███    ███   ███    █▀    ███    █▀    ███    ███ ███    ███ ███▌ ███   ███   ███
███    ███  ▄███▄▄▄      ▄███▄▄▄       ███    ███ ███    ███ ███▌ ███   ███   ███
███    ███ ▀▀███▀▀▀     ▀▀███▀▀▀     ▀█████████▀  ███    ███ ███▌ ███   ███   ███
███    ███   ███    █▄    ███    █▄    ███        ███    ███ ███  ███   ███   ███
███   ▄███   ███    ███   ███    ███   ███        ███    ███ ███  ███   ███   ███
████████▀    ██████████   ██████████  ▄████▀       ▀██████▀  █▀    ▀█   ███   █▀
                                                                                                   ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
            },
        },
        explorer = { enabled = false },
        indent = { enabled = true },
        image = {
            formats = {
                'png',
                'jpg',
                'jpeg',
                'gif',
                'bmp',
                'webp',
                'tiff',
                'heic',
                'avif',
                'mp4',
                'mov',
                'avi',
                'mkv',
                'webm',
                'pdf',
            },
        },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = false },
        scope = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        {
            ']]',
            function()
                Snacks.words.jump(vim.v.count1)
            end,
            desc = 'Next Reference',
            mode = { 'n' },
        },
        {
            '[[',
            function()
                Snacks.words.jump(-vim.v.count1)
            end,
            desc = 'Prev Reference',
            mode = { 'n' },
        },
        {
            '<leader>n',
            function()
                Snacks.notifier.show_history()
            end,
            desc = 'Notification History',
        },
    },
}
