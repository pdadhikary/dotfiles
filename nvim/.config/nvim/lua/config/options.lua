-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazyrepo,
        lazypath,
    }
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath 'state' .. '/undodir'

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.cursorline = true
vim.opt.confirm = true
vim.opt.guicursor = {
    'n-v-c:block-blinkwait700-blinkon400-blinkoff250',
    'i-ci-ve:ver25',
    'r-cr:hor20',
    'o:hor50',
}
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.scrolloff = 10
vim.opt.mouse = 'a'
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.textwidth = 80
vim.opt.colorcolumn = '+1'

vim.opt.isfname:append '@-@'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.undotree_DiffCommand = 'diff'

vim.diagnostic.config {
    -- Show inline messages
    virtual_text = true,
    -- Show signs in the gutter
    signs = true,
    -- Underline problematic text
    underline = true,
    -- Don't update diagnostics while typing
    update_in_insert = false,
    -- Sort diagnostics by severity
    severity_sort = true,
}
