-- Basic Settings
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = "a" -- Enable mouse support
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- But case sensitive when uppercase present
vim.opt.hlsearch = false -- Don't highlight search results
vim.opt.wrap = false -- Don't wrap lines
vim.opt.breakindent = true -- Maintain indent when wrapping indented lines
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.termguicolors = true -- True color support
vim.opt.signcolumn = "yes" -- Always show the signcolumn
vim.opt.cursorline = true -- Highlight current line
vim.opt.scrolloff = 8 -- Lines of context
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

require("config.lazy")
