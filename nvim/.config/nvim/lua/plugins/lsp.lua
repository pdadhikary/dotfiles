return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
        opts = {
            ensure_installed = {
                'lua_ls',
                'clangd',
                'pyrefly',
                'vtsls',
                'ruff',
                'stylua',
            },
            automatic_enable = true, -- default true, but explicit here for clarity
        },
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            -- Apply to all LSP servers
            vim.lsp.config('*', {
                capabilities = capabilities,
            })

            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                        },
                    },
                },
            })

            vim.lsp.config('basedpyright', {
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = 'standard',
                            autoImportCompletions = true,
                        },
                    },
                },
            })

            vim.lsp.config('ruff', {
                cmd = { 'ruff', 'server' },
                on_attach = function(client)
                    client.server_capabilities.hoverProvider = false
                end,
            })
        end,
    },
}
