return {

	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, for file icons
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true, -- Close Neo-tree if it's the last window
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,
			default_component_configs = {
				indent = {
					padding = 1,
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					default = "*",
					highlight = "NeoTreeFileIcon",
				},
				modified = {
					symbol = "[+]",
					highlight = "NeoTreeModified",
				},
				git_status = {
					symbols = {
						added = "✚",
						modified = "",
						deleted = "✖",
						renamed = "",
						untracked = "★",
						ignored = "◌",
						unstaged = "✗",
						staged = "✓",
						conflict = "",
					},
				},
			},
			window = {
				position = "left",
				width = 30,
				mappings = {
					["l"] = "open",
					["<CR>"] = "open",
					["<C-s>"] = "open_split",
					["<C-v>"] = "open_vsplit",
					["<C-t>"] = "open_tabnew",
					["<BS>"] = "navigate_up",
					["."] = "set_root",
					["H"] = "toggle_hidden",
				},
			},
			filesystem = {
				filtered_items = {
					visible = false, -- Show hidden files by default
					hide_dotfiles = false,
					hide_gitignored = true,
				},
				follow_current_file = true, -- Highlight the active file in Neo-tree
				hijack_netrw_behavior = "open_default",
			},
			buffers = {
				follow_current_file = true, -- Highlight the active buffer in Neo-tree
			},
		})
	end,
}
