-- Number
vim.opt.nu = true
vim.opt.rnu = true

-- Indent
--vim.opt.tabstop = 4
--vim.opt.softtabstop = 4
--vim.opt.shiftwidth = 4
--vim.opt.expandtab = true
--vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.wrap = false
vim.opt.showmode = false

-- Not generate swap/backup file
vim.opt.swapfile = false
vim.opt.backup = false

vim.o.mouse = "a"

local isWindowsOS = string.find(vim.loop.os_uname().sysname:lower(), "windows")
local home = isWindowsOS and "USERPROFILE" or "HOME"
vim.opt.undodir = os.getenv(home) .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
