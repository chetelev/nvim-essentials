return({
	"windwp/nvim-ts-autotag",
	opts = {
		autotag = {
			enable = true,
			enable_rename = true,
			enable_close = true,
			enable_close_on_slash = true,
		},
	},
	config = function(_plugin, opts)
		require("nvim-ts-autotag").setup(opts)
	end,
	dependencies = { "nvim-treesitter/nvim-treesitter" },
})
