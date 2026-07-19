vim.keymap.set({ 'n', 'v' }, '<C-k>', '20kzz', { desc = 'Jump up (cursor centered)' })
vim.keymap.set({ 'n', 'v' }, '<C-j>', '20jzz', { desc = 'Jump down (cursor centered)' })

vim.keymap.set('n', '<C-a>', 'gg0vG$', { desc = 'Select all' })
vim.keymap.set('i', '<C-a>', '<Esc>gg0vG$', { desc = 'Select all' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'In-place join lines' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('n', '<C-d>', 'mzyyp`zj', { desc = 'Duplicate current line and paste below' })
vim.keymap.set('i', '<C-d>', '<Esc>mzyyp`za', { desc = 'Duplicate current line and paste below' })

vim.keymap.set('n', 'd', '"_d', { desc = 'Delete without replacing clipboard' })
vim.keymap.set('n', 'x', '"_x', { desc = 'Cut without replacing clipboard' })
vim.keymap.set('n', 'c', '"_c', { desc = 'Change without replacing clipboard' })
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste without replacing clipboard' })

vim.keymap.set('n', 'Q', '<nop>', { desc = 'Disable replay macro' })


vim.keymap.set('n', '<leader>e', function()
        local files = require('mini.files')
        if not files.close() then files.open() end
    end, { desc = 'Open explorer' })

vim.keymap.set('n', 'H', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true, desc = 'Previous buffer/tab' })
vim.keymap.set('n', 'L', '<Cmd>BufferNext<CR>', { noremap = true, silent = true, desc = 'Next buffer/tab' })
vim.keymap.set('n', '<A-h>', '<Cmd>BufferMovePrevious<CR>', { noremap = true, silent = true, desc = 'Move buffer/tab left'})
vim.keymap.set('n', '<A-l>', '<Cmd>BufferMoveNext<CR>', { noremap = true, silent = true, desc = 'Move buffer/tab right'})
vim.keymap.set('n', '<A-K>', '<C-w>K', { noremap = true, silent = true, desc = 'Move window up'})
vim.keymap.set('n', '<A-J>', '<C-w>J', { noremap = true, silent = true, desc = 'Move window down'})
vim.keymap.set('n', '<A-H>', '<C-w>H', { noremap = true, silent = true, desc = 'Move window right'})
vim.keymap.set('n', '<A-L>', '<C-w>L', { noremap = true, silent = true, desc = 'Move window left'})

vim.keymap.set('n', '<leader>bd', '<Cmd>bd<CR>', { desc = 'Delete current buffer' })
vim.keymap.set('n', '<leader>bad', '<Cmd>%bd<CR>', { desc = 'Delete all buffers' })
