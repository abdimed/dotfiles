return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffer" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind [W]ord under cursor" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[F]ind [r]ecent" })
			vim.keymap.set("n", "<leader>fR", builtin.resume, { desc = "[F]ind [R]esume" })

			vim.keymap.set("n", "<leader><leader>", function()
				builtin.buffers({ sort_lastused = true, ignore_current_buffer = true, previewer = true })
			end, { desc = "Find Buffer" })

			vim.keymap.set("n", "<leader>fA", function()
				builtin.find_files({ hidden = true, no_ignore = true })
			end, { desc = "[F]ind [A]LL files (even ignored)" })

			vim.keymap.set("n", "<leader>fG", function()
				builtin.live_grep({
					additional_args = function(args)
						local new_args = { unpack(args) }
						table.insert(new_args, "--hidden")
						table.insert(new_args, "--no-ignore")
						return new_args
					end,
				})
			end, { desc = "[F]ind by [G]rep ALL (hidden & ignored)" })

			vim.keymap.set("n", "<leader>fn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[F]ind [N]eovim files" })

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			vim.keymap.set("n", "<leader>fT", "<cmd>TodoTelescope<cr>", { desc = "Find Todo" })
			vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope keywords=TODO<cr>", { desc = "Find TODO" })

			-- Git
			vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "[G]it [F]iles" })
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "[G]it [C]ommits" })
			vim.keymap.set("n", "<leader>gB", builtin.git_branches, { desc = "[G]it [B]ranches" })
		end,
	},
}
