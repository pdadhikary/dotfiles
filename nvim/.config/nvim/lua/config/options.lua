local options = {
    number = true,
    relativenumber = true,
    mouse = 'a',
    showmode = false,
    clipboard = 'unnamedplus',
    background = 'dark',
    breakindent = true,
    undofile = true,
    undodir = vim.fn.stdpath 'state' .. '/undodir',
    ignorecase = true,
    smartcase = true,
    signcolumn = 'yes',
    updatetime = 250,
    timeoutlen = 300,
    splitright = true,
    splitbelow = true,
    list = true,
    listchars = { tab = '» ', trail = '·', nbsp = '␣' },
    inccommand = 'split',
    cursorline = true,
    scrolloff = 10,
    confirm = true,
    guicursor = {
        'n-v-c:block-blinkwait700-blinkon400-blinkoff250', -- Normal/Visual/Command: blinking block
        'i-ci-ve:ver25', -- Insert/Command-line Insert/Visual-ex: steady vertical bar
        'r-cr:hor20', -- Replace modes: steady horizontal bar
        'o:hor50', -- Operator-pending: steady horizontal bar
    },
    hlsearch = false,
    incsearch = true,
    termguicolors = true,
    expandtab = true,
    autoindent = true,
    smartindent = false,
    cindent = false,
    tabstop = 4,
    shiftwidth = 4,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.colorcolumn = '80,' .. (vim.o.textwidth > 0 and vim.o.textwidth or 80)
-- vim.cmd 'highlight OverLength ctermbg=red ctermfg=white guibg=#592929'
-- vim.cmd(
--     'match OverLength /\\%>'
--         .. (vim.o.textwidth > 0 and vim.o.textwidth or 80)
--         .. 'v.\\+/'
-- )

vim.opt.isfname:append '@-@'

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.undotree_DiffCommand = 'diff'
