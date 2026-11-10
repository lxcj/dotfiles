vim.loader.enable()
require('vim._core.ui2').enable {}

vim.pack.add({
    'https://github.com/vague-theme/vague.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/windwp/nvim-autopairs',
    'https://github.com/lewis6991/gitsigns.nvim'
})
vim.cmd.colorscheme('vague')

require 'options'
require 'keymaps'
require 'autocmds'
require 'lsp'

require('nvim-autopairs').setup {}
require('gitsigns').setup {}

require('fzf-lua').setup {
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

local treesitter = require('nvim-treesitter')
treesitter.setup {}
treesitter.install {
    'lua',
    'bash',
}

vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function (args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype

        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then
            return
        end

        local ok_add = pcall(vim.treesitter.language.add, lang)
        if not ok_add then
            return
        end

        pcall(vim.treesitter.start, buf, lang)
    end,
})

