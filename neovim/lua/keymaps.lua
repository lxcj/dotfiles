local map = vim.keymap.set

map('n', '<space>', '', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear search highlights
map('n', '<esc>', function() vim.cmd.nohlsearch() end)

-- fzf
local fzf = require('fzf-lua')

map('n', '<leader>f', function() fzf.files() end, { desc = 'Open file picker' })
map('n', '<leader>b', function() fzf.buffers() end, { desc = 'Open buffer picker' })
map('n', '<leader>d', function() fzf.quickfix() end, { desc = 'Open quickfix list' })
map('n', '<leader>s', function() fzf.treesitter() end, { desc = 'Open symbol picker' })
map('n', '<leader>a', function() fzf.lsp_code_actions() end, { desc = 'Code actions' })
map('n', '<leader>/', function() fzf.live_grep() end, { desc = 'Global search in workspace folder' })
map('n', '<leader>?', function() fzf.commands() end, { desc = 'Search commands' })

map('n', '<leader>gs', function() fzf.git_status() end, { desc = 'Show Git status' })
map('n', '<leader>gl', function() fzf.git_bcommits() end, { desc = 'Show Git commits (current file)' })

