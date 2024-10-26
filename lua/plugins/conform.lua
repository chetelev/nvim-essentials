return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" },
		},
	},
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format()
			end,
			mode = "n",
			desc = "Format Buffer",
		},
	},
}
