return {
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					vue = { "prettier" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					php = { "php-cs-fixer" },
					blade = { "blade-formatter" },
					json = { "prettier" },
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>bf", function()
				conform.format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
			end, { desc = "Format file" })
		end,
	},
}
