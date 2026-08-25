vim.pack.add { 'https://github.com/folke/persistence.nvim' }

require('persistence').setup {
    dir = vim.fn.stdpath('state') .. '/sessions/',
    need = 1, -- save session when at least one file is open
    branch = true, -- use git branch to save session
    options = {
        'buffers',
        'curdir',
        'tabpages',
        'winsize',
    },
}

-- Restore session when neovim starts without file arguments
vim.api.nvim_create_autocmd('VimEnter', {
  nested = true,
  callback = function()
    if vim.fn.argc() == 0 then
      require('persistence').load()
    end
  end,
})

local keymap = vim.keymap.set

keymap('n', '<leader>qs', function()
    require('persistence').save()
end, { desc = 'Save session' })

keymap('n', '<leader>ql', function()
    require('persistence').load()
end, { desc = 'Load session for current directory' })

keymap('n', '<leader>qL', function()
    require('persistence').load({ last = true })
end, { desc = 'Load last session' })

keymap('n', '<leader>qd', function()
    require('persistence').stop()
end, { desc = 'Stop session saving' })
