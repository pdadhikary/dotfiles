return {
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        opts = {
            -- add any options here
        },
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
    },
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
    { 'nvim-mini/mini.notify', version = false, opts = {} },
    { 'nvim-mini/mini.indentscope', version = false, opts = {} },
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
        opts = {
            sections = {
                lualine_x = {
                    {
                        require('noice').api.status.command.get,
                        cond = require('noice').api.status.command.has,
                        color = { fg = '#ff9e64' },
                    },
                },
                lualine_y = {
                    'encoding',
                    'fileformat',
                    'filetype',
                },
                lualine_c = {
                    'diagnostics',
                    'lsp_status',
                },
            },
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {},
        version = '^1.0.0',
    },
    {
        'ibhagwan/fzf-lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = function()
            local actions = require('fzf-lua').actions
            return {
                files = {
                    actions = {
                        ['default'] = actions.file_edit,
                    },
                },
                grep = {
                    actions = {
                        ['default'] = actions.file_edit,
                    },
                },
            }
        end,
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
            quickfile = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            lazygit = { enabled = true },
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
        },
    },
}
