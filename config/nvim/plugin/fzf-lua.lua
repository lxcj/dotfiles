vim.pack.add { 'https://github.com/ibhagwan/fzf-lua' }

local fzf = require('fzf-lua')
local keymap = vim.keymap.set

fzf.setup {
    winopts = {
        preview = {
            border = vim.o.winborder,
        },
        border = vim.o.winborder,
    },
    files = {
        file_icons = false,
        hidden = false,
    },
    defaults = {
        formatter = 'path.dirname_first', -- Grey-out path before filename
    },
    keymap = {
        fzf = {
            ['alt-a'] = 'toggle-all',
        },
    },
}

keymap('n', '<leader>f', function() fzf.files() end, { desc = 'Open file picker' })
keymap('n', '<leader>b', function() fzf.buffers() end, { desc = 'Open buffer picker' })
keymap('n', '<leader>d', function() fzf.quickfix() end, { desc = 'Open quickfix list' })
keymap('n', '<leader>s', function() fzf.treesitter() end, { desc = 'Open symbol picker' })
keymap('n', '<leader>a', function() fzf.lsp_code_actions() end, { desc = 'Code actions' })
keymap('n', '<leader>/', function() fzf.live_grep() end, { desc = 'Global search in workspace folder' })
keymap('n', '<leader>?', function() fzf.commands() end, { desc = 'Search commands' })

keymap('n', '<leader>gs', function() fzf.git_status() end, { desc = 'Show Git status' })
keymap('n', '<leader>gl', function() fzf.git_bcommits() end, { desc = 'Show Git commits (current file)' })

