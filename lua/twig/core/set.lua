-- Relative Line Numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab Spacing Size
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- Auto Tab Spacing
vim.opt.smartindent = true

-- No Text Wrapping
vim.opt.wrap = false

-- Undo Files not Backup Files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search Highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Better Colors
vim.opt.termguicolors = true

-- Some Boarder Stuff
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.isfname:append("@-@")

-- Set Update Time as Low as Possible Without Bugs
vim.opt.updatetime = 50
