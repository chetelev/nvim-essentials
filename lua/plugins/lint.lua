return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				json = { "jsonlint" },
				-- Web Development
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },

				-- HTML/CSS
				html = { "htmlhint" },
				css = { "stylelint" },
				scss = { "stylelint" },

				-- Python
				python = { "ruff" },

				-- Lua
				-- lua = { "selene" },

				-- Go
				go = { "golangcilint" },

				-- Rust
				rust = { "clippy" },
			}

			local LINT_DELAY = 500 -- VSCode-like delay

			vim.api.nvim_create_augroup("lint", { clear = true })

			-- Lint on file open
			vim.api.nvim_create_autocmd({ "BufReadPost" }, {
				group = "lint",
				callback = function()
					require("lint").try_lint()
				end,
			})

			-- Lint on save
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				group = "lint",
				callback = function()
					require("lint").try_lint()
				end,
			})

			-- Lint when leaving insert mode, but with a delay
			vim.api.nvim_create_autocmd({ "InsertLeave" }, {
				group = "lint",
				callback = function()
					vim.defer_fn(function()
						require("lint").try_lint()
					end, LINT_DELAY)
				end,
			})

			-- Debounced lint on text change in normal mode
			local timer = nil
			vim.api.nvim_create_autocmd({ "TextChanged" }, {
				group = "lint",
				callback = function()
					if timer then
						timer:stop()
					end
					timer = vim.defer_fn(function()
						require("lint").try_lint()
					end, LINT_DELAY)
				end,
			})

			-- Manual lint command
			vim.api.nvim_create_user_command("Lint", function()
				require("lint").try_lint()
			end, {})
		end,
	},
}
