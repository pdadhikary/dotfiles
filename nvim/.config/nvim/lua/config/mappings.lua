vim.keymap.set({ 'n', 'x' }, '<C-j>', function()
    vim.cmd.normal({ '20jzz', bang = true })
end)

vim.keymap.set({ 'n', 'x' }, '<C-k>', function()
    vim.cmd.normal({ '20kzz', bang = true })
end)

vim.keymap.set('n', '<C-a>', function()
    vim.cmd.normal({ 'ggVG', bang = true })
end, { desc = 'Select all' })

vim.keymap.set('i', '<C-a>', function()
    vim.cmd.stopinsert()
    vim.cmd.normal({ 'ggVG', bang = true })
end, { desc = 'Select all' })

vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'In-place join lines' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection up' })

vim.keymap.set(
    'v',
    '<C-d>',
    'yPgv',
    { desc = 'Duplicate current selection and paste below' }
)
vim.keymap.set(
    'n',
    '<C-d>',
    'mzyyp`zj',
    { desc = 'Duplicate current line and paste below; normal model' }
)
vim.keymap.set(
    'i',
    '<C-d>',
    '<Esc>mzyyp`za',
    { desc = 'Duplicate current line and paste below; insert mode' }
)

vim.keymap.set('n', 'd', '"_d', { desc = 'Delete without replacing clipboard' })
vim.keymap.set('n', 'x', '"_x', { desc = 'Cut without replacing clipboard' })
vim.keymap.set('n', 'c', '"_c', { desc = 'Change without replacing clipboard' })
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste without replacing clipboard' })

vim.keymap.set('n', 'Q', '<nop>', { desc = 'Disable replay macro' })

vim.keymap.set('n', '<leader>e', function()
    local files = require 'mini.files'
    if not files.close() then
        files.open()
    end
end, { desc = 'Open explorer' })

vim.keymap.set(
    'n',
    'H',
    '<Cmd>BufferPrevious<CR>',
    { noremap = true, silent = true, desc = 'Previous buffer/tab' }
)
vim.keymap.set(
    'n',
    'L',
    '<Cmd>BufferNext<CR>',
    { noremap = true, silent = true, desc = 'Next buffer/tab' }
)
vim.keymap.set(
    'n',
    '<leader>h',
    '<Cmd>BufferMovePrevious<CR>',
    { noremap = true, silent = true, desc = 'Move buffer/tab left' }
)
vim.keymap.set(
    'n',
    '<leader>l',
    '<Cmd>BufferMoveNext<CR>',
    { noremap = true, silent = true, desc = 'Move buffer/tab right' }
)
vim.keymap.set(
    'n',
    '<A-K>',
    '<C-w>K',
    { noremap = true, silent = true, desc = 'Move window up' }
)
vim.keymap.set(
    'n',
    '<A-J>',
    '<C-w>J',
    { noremap = true, silent = true, desc = 'Move window down' }
)
vim.keymap.set(
    'n',
    '<A-H>',
    '<C-w>H',
    { noremap = true, silent = true, desc = 'Move window right' }
)
vim.keymap.set(
    'n',
    '<A-L>',
    '<C-w>L',
    { noremap = true, silent = true, desc = 'Move window left' }
)

vim.keymap.set(
    'n',
    '<leader>bd',
    '<Cmd>bd<CR>',
    { desc = 'Delete current buffer' }
)
vim.keymap.set(
    'n',
    '<leader>bad',
    '<Cmd>%bd<CR>',
    { desc = 'Delete all buffers' }
)

vim.keymap.set({ 'n', 'v' }, '<leader>ff', function()
    require('conform').format { async = true, lsp_fallback = true }
end, { desc = 'Format buffer' })

vim.keymap.set('v', '<', '<gv', { desc = 'Unindent and keep selection' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent and keep selection' })

vim.keymap.set(
    'n',
    'n',
    'nzzzv',
    { desc = 'Next search result; cursor centered' }
)
vim.keymap.set(
    'n',
    'N',
    'Nzzzv',
    { desc = 'Previous search result; cursor centered' }
)


vim.keymap.set(
    'n',
    '<leader>X',
    '<Cmd>!chmod +x %<CR>',
    { desc = 'Make file executable' }
)

vim.keymap.set(
    'n',
    '<leader>re',
    '<Cmd>restart<CR>',
    { desc = 'Restart NeoVim' }
)

vim.keymap.set('n', '<leader>u', function()
    vim.cmd.packadd 'nvim.undotree'
    require('undotree').open()
end, { desc = 'Toggle undotree' })

vim.keymap.set('n', '<leader>ls', function()
    require('fzf-lua').buffers()
end, { desc = 'List buffers' })

vim.keymap.set('n', '<leader>sf', function()
    require('fzf-lua').files()
end, { desc = 'List buffers' })

vim.keymap.set('n', '<leader>sc', function()
    require('fzf-lua').files { cwd = vim.fn.stdpath 'config' }
end, { desc = 'List neovim config files' })

vim.keymap.set('n', '<leader>sr', function()
    require('fzf-lua').oldfiles()
end, { desc = 'List recent files' })

vim.keymap.set('n', '<leader>sg', function()
    require('fzf-lua').grep()
end, { desc = 'Grep search' })

vim.keymap.set('n', '<leader>sa', function()
    require('fzf-lua').autocmds()
end, { desc = 'List autocommands' })

vim.keymap.set('n', '<leader>sm', function()
    require('fzf-lua').marks()
end, { desc = 'List marks' })

vim.keymap.set('n', '<leader>sz', function()
    require('fzf-lua').zoxide()
end, { desc = 'List recent directories' })

vim.keymap.set('n', '<leader>sd', function()
    require('fzf-lua').diagnostics_workspace()
end, { desc = 'List workspace diagnostics' })

vim.keymap.set('n', '<leader>sD', function()
    require('fzf-lua').diagnostics_document()
end, { desc = 'List document diagnostics' })

vim.keymap.set('n', '<leader>sk', function()
    require('fzf-lua').keymaps()
end, { desc = 'List keymaps' })

vim.keymap.set('n', 'gd', function()
    require('fzf-lua').lsp_definitions()
end, { desc = 'List definitions/Goto definition' })

vim.keymap.set('n', 'gD', function()
    require('fzf-lua').lsp_declarations()
end, { desc = 'List declarations/Goto declaration' })

vim.keymap.set('n', 'gr', function()
    require('fzf-lua').lsp_references()
end, { desc = 'List references/Goto reference' })

vim.keymap.set('n', 'gI', function()
    require('fzf-lua').lsp_implementations()
end, { desc = 'List Implementations/Goto implementation' })

vim.keymap.set('n', 'gy', function()
    require('fzf-lua').lsp_typedefs()
end, { desc = 'List type definitions' })

vim.keymap.set('n', 'gai', function()
    require('fzf-lua').lsp_incoming_calls()
end, { desc = 'List incoming calls' })

vim.keymap.set('n', 'gao', function()
    require('fzf-lua').lsp_outgoing_calls()
end, { desc = 'List outgoing calls' })

vim.keymap.set('n', '<leader>ss', function()
    require('fzf-lua').lsp_document_symbols()
end, { desc = 'List document symbols' })

vim.keymap.set('n', '<leader>sS', function()
    require('fzf-lua').lsp_workspace_symbols()
end, { desc = 'List workspace symbols' })

vim.keymap.set('n', '<leader>sH', function()
    require('fzf-lua').highlights()
end, { desc = 'List highlight groups' })

vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename symbol' })

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file", silent = true })
