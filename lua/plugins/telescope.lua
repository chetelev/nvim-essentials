return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required dependency for telescope
			"nvim-telescope/telescope-fzy-native.nvim", -- Optional: Fuzzy finder performance
			"nvim-telescope/telescope-file-browser.nvim", -- Optional: File browser extension
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
					prompt_prefix = "🔍 ",
					selection_caret = "➜ ",
					path_display = { "truncate" },
					layout_config = {
						horizontal = { width = 0.9 },
					},
					file_ignore_patterns = { "node_modules", "%.git/" }, -- Ignore unwanted directories
				},
				pickers = {
					find_files = {
						theme = "dropdown",
						previewer = false, -- Disable preview for faster performance
					},
				},
				extensions = {
					fzy_native = {
						override_generic_sorter = true,
						override_file_sorter = true,
					},
				},
			})

			-- Load telescope extensions
			telescope.load_extension("fzy_native")
			telescope.load_extension("file_browser")
		end,
	},
}
