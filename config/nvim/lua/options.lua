local opt = vim.opt

-- Enable mouse in normal and visual mode
opt.mouse = 'nv'

-- Keep a minimum number of screen lines above and below the cursor
opt.scrolloff = 8

-- Keep a minimum number of columns left and right of the cursor
opt.sidescrolloff = 8

-- Sync clipboard with system
opt.clipboard = 'unnamedplus'

-- Enable undo history
opt.undofile = true

-- Enable confirm dialog for unsaved changes
opt.confirm = true

-- Set border style for floating windows
opt.winborder = 'single'

-- Hide mode as it is shown in the status line
opt.showmode = false

-- Set indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Show current line number
opt.number = true

-- Enable relative line numbers
opt.relativenumber = true

-- Disable line wrap
opt.wrap = false

-- Make search case-insensitive
opt.ignorecase = true
opt.smartcase = true

opt.updatetime = 300
opt.timeoutlen = 300

