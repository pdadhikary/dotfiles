return {
    'benomahony/uv.nvim',
    ft = 'python',
    opts = {
        auto_activate_venv = true,
        picker_integration = true,
        keymaps = { prefix = '<leader>x' },
        execution = { run_command = 'uv run python' },
    },
}
