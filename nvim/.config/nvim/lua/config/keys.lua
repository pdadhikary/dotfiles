-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set(
    't',
    '<Esc><Esc>',
    '<C-\\><C-n>',
    { desc = 'Exit terminal mode' }
)

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

-- explorer
vim.keymap.set('n', '<leader>e', '<CMD>Oil<CR>', { desc = 'Open Oil Explorer' })

-- navigation
vim.keymap.set({ 'n', 'v' }, '<C-j>', '20jzz', { desc = 'Jump Down' })
vim.keymap.set({ 'n', 'v' }, '<C-k>', '20kzz', { desc = 'Jump Up' })

-- editing
vim.keymap.set('n', '<C-a>', 'gg0vG$', { desc = 'Select All' })
vim.keymap.set('i', '<C-a>', '<Esc>gg0vG$', { desc = 'Select All' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('n', '<C-d>', 'yyp', { desc = 'Duplicate line' })
vim.keymap.set('i', '<C-d>', '<Esc>yypi', { desc = 'Duplicate line' })

vim.keymap.set('n', 'd', '"_d', { desc = 'Delete without replacing clipboard' })
vim.keymap.set('n', 'x', '"_x', { desc = 'Cut without replacing clipboard' })
vim.keymap.set('n', 'c', '"_c', { desc = 'Change without replacing clipboard' })
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste without replacing clipboard' })

-- folds
vim.keymap.set('n', '<leader><', function()
    if not vim.opt.foldmethod then
        vim.opt.foldmethod = 'indent'
    end
    vim.cmd 'normal! zM'
end, { desc = 'Fold all' })

vim.keymap.set('n', '<leader>>', function()
    vim.opt.foldenable = false
    vim.cmd 'normal! zR'
end, { desc = 'Open all folds' })

-- save
vim.keymap.set({ 'n', 'v', 'i' }, '<C-s>', function()
    local _, _ = pcall(function()
        vim.cmd [[set ff=unix]]
    end)
    require('conform').format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    }
    vim.cmd 'write'
end, { noremap = true, silent = true, desc = 'Save & Format current buffer' })

-- nop
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Disable replay macro' })
