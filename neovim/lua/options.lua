local o = vim.opt

o.termguicolors = true
o.winborder = 'single' -- Set border style for floating windows

o.mouse = a -- Enable mouse
o.scrolloff = 10
o.sidescrolloff = 10

o.clipboard = 'unnamedplus' -- Use system clipboard
o.undofile = true -- Enable undo history
o.confirm = true -- Enable confirm dialog for unsaved changes

o.number = true -- Show current line number
o.relativenumber = true

o.wrap = false -- Diable line wrap

-- Indentation
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

-- Make search case-insensitive
o.ignorecase = true
o.smartcase = true

