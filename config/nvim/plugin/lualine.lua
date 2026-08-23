vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'lsp_status'},
        lualine_z = {'location'}
    },
}

