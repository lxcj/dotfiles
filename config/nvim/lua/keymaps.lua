local keymap = vim.keymap.set

-- Set space as leader key
keymap('n', '<space>', '', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear search highlights
keymap('n', '<esc>', function() vim.cmd.nohlsearch() end)

-- Buffers
keymap('n', '<A-l>', function() vim.cmd.bnext() end, { desc = 'Go to next buffer' })
keymap('n', '<A-h>', function() vim.cmd.bprevious() end, { desc = 'Go to previous buffer' })

-- Fix command typos + shortcuts
local remaps = {
    ['W'] = 'w',
    ['Q'] = 'q',
    ['Wq'] = 'wq',
    ['bc'] = 'BufferClose'
}
for k, v in pairs(remaps) do
    keymap('ca', k, v)
end
keymap({ 'c' }, '<cr>', '<C-]><cr>')

keymap("i", ";;", "<Esc>m`A;<Esc>`'li", { desc = "Add semicolon at EOL (Insert Mode)" })
keymap("i", ",,", "<Esc>m`A,<Esc>`'li", { desc = "Add comma at EOL (Insert Mode)" })

-- Disable yank on delete/change
keymap({ "n", "v" }, "d", '"_d')
keymap({ "n", "v" }, "D", '"_D')
keymap({ "n", "v" }, "c", '"_c')
keymap({ "n", "v" }, "C", '"_C')
keymap({ "n", "v" }, "s", '"_s')
keymap({ "n", "v" }, "S", '"_S')
keymap("n", "x", '"_x')
keymap("n", "X", '"_X')

