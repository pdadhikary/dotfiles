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
                'basedpyright',
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
            -- Per-server config via the new native API.
            -- These merge into what mason-lspconfig auto-enables; you don't call .setup() yourself anymore.
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = { globals = { 'vim' } },
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
                on_attach = function(client, _)
                    client.server_capabilities.hoverProvider = false
                end,
            })
        end,
    },
}
