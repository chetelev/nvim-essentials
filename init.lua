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
vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci:ver25,r-cr:hor20,o:hor50"

-- Move between buffers
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

require("config.lazy")

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })

-- Optional: File browser extension (if installed)
vim.keymap.set("n", "<leader>fe", ":Telescope file_browser<CR>", { desc = "File browser" })

-- Neotree
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
vim.keymap.set("n", "<C-e>", ":Neotree focus<CR>", { desc = "Focus Neo-tree" })
