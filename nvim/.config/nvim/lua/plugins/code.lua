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
                'fish'
            },
            auto_install = true,
            highlight = {
                enable = true,
            },
        },
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
                javascript = { "prettierd" },
                typescript = { "prettierd" },
                javascriptreact = { "prettierd" },
                typescriptreact = { "prettierd" },
                json = { "prettierd" },
                jsonc = { "prettierd" },
            },
        },
    }
}
