return {
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            vim.cmd 'colorscheme rose-pine-moon'
        end,
    },
    {
        'nvim-mini/mini.files',
        version = false,
        opts = {},
    },
    {
        'nvim-mini/mini.hipatterns',
        version = false,
        opts = function()
            local hipatterns = require 'mini.hipatterns'
            return {
                highlighters = {
                    fixme = {
                        pattern = '%f[%w]()FIXME()%f[%W]',
                        group = 'MiniHipatternsFixme',
                    },
                    hack = {
                        pattern = '%f[%w]()HACK()%f[%W]',
                        group = 'MiniHipatternsHack',
                    },
                    todo = {
                        pattern = '%f[%w]()TODO()%f[%W]',
                        group = 'MiniHipatternsTodo',
                    },
                    note = {
                        pattern = '%f[%w]()NOTE()%f[%W]',
                        group = 'MiniHipatternsNote',
                    },
                    hex_color = hipatterns.gen_highlighter.hex_color(),
                },
            }
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        opts = {},
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {},
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },
    {
        'Bekaboo/dropbar.nvim',
        -- optional, but required for fuzzy finder support
        dependencies = {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
        config = function()
            local dropbar_api = require 'dropbar.api'
            vim.keymap.set(
                'n',
                '<Leader>;',
                dropbar_api.pick,
                { desc = 'Pick symbols in winbar' }
            )
            vim.keymap.set(
                'n',
                '[;',
                dropbar_api.goto_context_start,
                { desc = 'Go to start of current context' }
            )
            vim.keymap.set(
                'n',
                '];',
                dropbar_api.select_next_context,
                { desc = 'Select next context' }
            )
        end,
        opts = {},
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {},
        keys = {
            {
                '<leader>?',
                function()
                    require('which-key').show { global = false }
                end,
                desc = 'Buffer Local Keymaps (which-key)',
            },
        },
    },
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            picker = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            lazygit = { enabled = true },
            animate = {
                duration = 20,
                easing = 'linear',
                fps = 120,
            },
            dashboard = {
                width = 60,
                row = nil, -- dashboard position. nil for center
                col = nil, -- dashboard position. nil for center
                pane_gap = 4, -- empty columns between vertical panes
                autokeys = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', -- autokey sequence
                -- These settings are used by some built-in sections
                preset = {
                    -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
                    ---@type fun(cmd:string, opts:table)|nil
                    pick = nil,
                    -- Used by the `keys` section to show keymaps.
                    -- Set your custom keymaps here.
                    -- When using a function, the `items` argument are the default keymaps.
                    ---@type snacks.dashboard.Item[]
                    keys = {
                        {
                            icon = ' ',
                            key = 'f',
                            desc = 'Find File',
                            action = ":lua Snacks.dashboard.pick('files')",
                        },
                        {
                            icon = ' ',
                            key = 'n',
                            desc = 'New File',
                            action = ':ene | startinsert',
                        },
                        {
                            icon = ' ',
                            key = 'g',
                            desc = 'Find Text',
                            action = ":lua Snacks.dashboard.pick('live_grep')",
                        },
                        {
                            icon = ' ',
                            key = 'r',
                            desc = 'Recent Files',
                            action = ":lua Snacks.dashboard.pick('oldfiles')",
                        },
                        {
                            icon = ' ',
                            key = 'c',
                            desc = 'Config',
                            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                        },
                        {
                            icon = ' ',
                            key = 's',
                            desc = 'Restore Session',
                            section = 'session',
                        },
                        {
                            icon = '󰒲 ',
                            key = 'L',
                            desc = 'Lazy',
                            action = ':Lazy',
                            enabled = package.loaded.lazy ~= nil,
                        },
                        {
                            icon = ' ',
                            key = 'q',
                            desc = 'Quit',
                            action = ':qa',
                        },
                    },
                    -- Used by the `header` section
                    header = [[
       _                        
       \`*-.                    
        )  _`-.                 
       .  : `. .                
       : _   '  \               
       ; *` _.   `*-._          
       `-.-'          `-.       
         ;       `       `.     
         :.       .        \    
         . \  .   :   .-'   .   
         '  `+.;  ;  '      :   
         :  '  |    ;       ;-. 
         ; '   : :`-:     _.`* ;
[bug] .*' /  .*' ; .*`- +'  `*' 
      `*-*   `*-*  `*-*']],
                },
                -- item field formatters
                formats = {
                    icon = function(item)
                        if
                            item.file and item.icon == 'file'
                            or item.icon == 'directory'
                        then
                            return Snacks.dashboard.icon(item.file, item.icon)
                        end
                        return { item.icon, width = 2, hl = 'icon' }
                    end,
                    footer = { '%s', align = 'center' },
                    header = { '%s', align = 'center' },
                    file = function(item, ctx)
                        local fname = vim.fn.fnamemodify(item.file, ':~')
                        fname = ctx.width
                                and #fname > ctx.width
                                and vim.fn.pathshorten(fname)
                            or fname
                        if #fname > ctx.width then
                            local dir = vim.fn.fnamemodify(fname, ':h')
                            local file = vim.fn.fnamemodify(fname, ':t')
                            if dir and file then
                                file = file:sub(-(ctx.width - #dir - 2))
                                fname = dir .. '/…' .. file
                            end
                        end
                        local dir, file = fname:match '^(.*)/(.+)$'
                        return dir
                                and {
                                    { dir .. '/', hl = 'dir' },
                                    { file, hl = 'file' },
                                }
                            or { { fname, hl = 'file' } }
                    end,
                },
                sections = {
                    { section = 'header' },
                    { section = 'keys', gap = 1, padding = 1 },
                    { section = 'startup' },
                },
            },
        },
        keys = {
            {
                '<leader>gg',
                function()
                    Snacks.lazygit()
                end,
                desc = 'Open lazygit',
            },
            {
                '<c-/>',
                function()
                    Snacks.terminal()
                end,
                desc = 'Toggle terminal',
            },
            {
                '<leader>ls',
                function()
                    Snacks.picker.buffers()
                end,
                desc = 'List buffers',
            },
            {
                '<leader>sc',
                function()
                    Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
                end,
                desc = 'Search neovim config files',
            },
            {
                '<leader>sf',
                function()
                    Snacks.picker.files()
                end,
                desc = 'Search files',
            },
            {
                '<leader>sr',
                function()
                    Snacks.picker.recent()
                end,
                desc = 'Search recent files',
            },
            {
                '<leader>sg',
                function()
                    Snacks.picker.grep()
                end,
                desc = 'Grep search',
            },
            {
                '<leader>sa',
                function()
                    Snacks.picker.autocmds()
                end,
                desc = 'Autocmds',
            },
            {
                '<leader>sd',
                function()
                    Snacks.picker.diagnostics()
                end,
                desc = 'Diagnostics',
            },
            {
                '<leader>sD',
                function()
                    Snacks.picker.diagnostics_buffer()
                end,
                desc = 'Buffer Diagnostics',
            },
            {
                '<leader>sk',
                function()
                    Snacks.picker.keymaps()
                end,
                desc = 'Keymaps',
            },

            {
                'gd',
                function()
                    Snacks.picker.lsp_definitions()
                end,
                desc = 'Goto Definition',
            },
            {
                'gD',
                function()
                    Snacks.picker.lsp_declarations()
                end,
                desc = 'Goto Declaration',
            },
            {
                'gr',
                function()
                    Snacks.picker.lsp_references()
                end,
                nowait = true,
                desc = 'References',
            },
            {
                'gI',
                function()
                    Snacks.picker.lsp_implementations()
                end,
                desc = 'Goto Implementation',
            },
            {
                'gy',
                function()
                    Snacks.picker.lsp_type_definitions()
                end,
                desc = 'Goto T[y]pe Definition',
            },
            {
                'gai',
                function()
                    Snacks.picker.lsp_incoming_calls()
                end,
                desc = 'C[a]lls Incoming',
            },
            {
                'gao',
                function()
                    Snacks.picker.lsp_outgoing_calls()
                end,
                desc = 'C[a]lls Outgoing',
            },
            {
                '<leader>ss',
                function()
                    Snacks.picker.lsp_symbols()
                end,
                desc = 'LSP Symbols',
            },
            {
                '<leader>sS',
                function()
                    Snacks.picker.lsp_workspace_symbols()
                end,
                desc = 'LSP Workspace Symbols',
            },
            {
                '<leader>sH',
                function()
                    Snacks.picker.highlights()
                end,
                desc = 'Highlights',
            },
            {
                ']]',
                function()
                    Snacks.words.jump(vim.v.count1)
                end,
                desc = 'Next Reference',
                mode = { 'n', 't' },
            },
            {
                '[[',
                function()
                    Snacks.words.jump(-vim.v.count1)
                end,
                desc = 'Prev Reference',
                mode = { 'n', 't' },
            },

            {
                '<leader>.',
                function()
                    Snacks.scratch()
                end,
                desc = 'Toggle Scratch Buffer',
            },
            {
                '<leader>S',
                function()
                    Snacks.scratch.select()
                end,
                desc = 'Select Scratch Buffer',
            },
            {
                '<leader>n',
                function()
                    Snacks.notifier.show_history()
                end,
                desc = 'Notification History',
            },
        },
    },
}
