return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        opts = {
            ensure_installed = {
                'vimdoc',
                'lua',
                'pyhton',
                'javascript',
                'typescript',
                'c',
                'sql',
                'bash',
                'fish',
            },
            auto_install = true,
            highlight = {
                enable = true,
            },
        },
    },
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                lua = { 'stylua' },
                python = { 'ruff_organize_imports', 'ruff_fix', 'ruff_format' },
                javascript = { 'prettierd' },
                typescript = { 'prettierd' },
                javascriptreact = { 'prettierd' },
                typescriptreact = { 'prettierd' },
                json = { 'prettierd' },
                jsonc = { 'prettierd' },
            },
        },
    },
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },

        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source
        -- build = 'cargo build --release',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = 'default' },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono',
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = false } },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = 'prefer_rust_with_warning' },
        },
        opts_extend = { 'sources.default' },
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
            {
                'jay-babu/mason-nvim-dap.nvim',
                dependencies = { 'mason-org/mason.nvim' },
                config = function()
                    require('mason-nvim-dap').setup {
                        ensure_installed = { 'python', 'codelldb' }, -- add/remove adapters as needed
                        automatic_installation = true,
                        handlers = {}, -- default handler auto-registers adapters with nvim-dap
                    }
                end,
            },
            {
                'mfussenegger/nvim-dap-python',
                config = function()
                    require('dap-python').setup 'uv'
                end,
            },
        },
        config = function()
            local dap, dapui = require 'dap', require 'dapui'
            dapui.setup {}

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.keymap.set(
                'n',
                '<F5>',
                dap.continue,
                { desc = 'Debug: Continue' }
            )
            vim.keymap.set(
                'n',
                '<F10>',
                dap.step_over,
                { desc = 'Debug: Step Over' }
            )
            vim.keymap.set(
                'n',
                '<F11>',
                dap.step_into,
                { desc = 'Debug: Step Into' }
            )
            vim.keymap.set(
                'n',
                '<F12>',
                dap.step_out,
                { desc = 'Debug: Step Out' }
            )
            vim.keymap.set(
                'n',
                '<leader>b',
                dap.toggle_breakpoint,
                { desc = 'Debug: Toggle Breakpoint' }
            )
            vim.keymap.set('n', '<leader>B', function()
                dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
            end, { desc = 'Debug: Conditional Breakpoint' })
            vim.keymap.set(
                'n',
                '<leader>dr',
                dap.repl.open,
                { desc = 'Debug: Open REPL' }
            )
            vim.keymap.set(
                'n',
                '<leader>du',
                dapui.toggle,
                { desc = 'Debug: Toggle UI' }
            )
        end,
    },
}
