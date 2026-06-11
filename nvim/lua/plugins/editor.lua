return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({
				n_lines = 500,
				custom_textobjects = {
					g = function()
						local from = { line = 1, col = 1 }
						local to = {
							line = vim.fn.line("$"),
							col = math.max(vim.fn.getline(vim.fn.line("$")):len(), 1),
						}
						return { from = from, to = to }
					end,
					u = require("mini.ai").gen_spec.function_call(),
					U = require("mini.ai").gen_spec.function_call({ name_pattern = "[%w_]" }),
				},
			})
			require("mini.pairs").setup()
			require("mini.sessions").setup()
			require("mini.cursorword").setup()
		end,
	},

	{
		"nvim-mini/mini.icons",
		lazy = true,
		opts = {
			file = {
				[".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
				["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
			},
			filetype = {
				dotenv = { glyph = "", hl = "MiniIconsYellow" },
			},
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},

	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		opts = {},
		keys = {
			{ "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
			{ "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
		},
	},

	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
		keys = {
			{ "<leader>cD", "<cmd>Trouble diagnostics toggle focus=true<cr>", desc = "[C]ode [D]iagnostics (All)" },
			{ "<leader>cd", "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>", desc = "[C]ode [d]iagnostics (Buffer)" },
			{ "<leader>cs", "<cmd>Trouble symbols toggle focus=true win.position=right win.size=80<cr>", desc = "[C]ode [s]ymbols" },
			{ "<leader>cr", "<cmd>Trouble lsp toggle focus=true win.position=right win.size=80<cr>", desc = "[C]ode [r]eferences" },
		},
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "gs", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "gS", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		},
	},

	{ "mg979/vim-visual-multi", branch = "master" },

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			panel = {
				enabled = true,
				auto_refresh = false,
				keymap = { jump_prev = "[[", jump_next = "]]", accept = "<CR>", refresh = "gr", open = "<M-CR>" },
				layout = { position = "bottom", ratio = 0.4 },
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<C-j>",
					accept_word = "<C-l>",
					accept_line = false,
					next = "<C-k>",
					prev = "<C-h>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
				gitcommit = false,
				gitrebase = false,
				["."] = false,
			},
			copilot_node_command = vim.fn.exepath("node") ~= "" and vim.fn.exepath("node") or "node",
		},
	},

	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
		keys = {
			{ "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Open diffview" },
			{ "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
			{ "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history (current file)" },
			{ "<leader>dH", "<cmd>DiffviewFileHistory<cr>", desc = "File history (repo)" },
			{ "<leader>de", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle file explorer" },
			{
				"<leader>db",
				function()
					local actions = require("telescope.actions")
					local action_state = require("telescope.actions.state")
					require("telescope.builtin").git_branches({
						attach_mappings = function(_, map)
							local function open_diff(bufnr)
								local branch = action_state.get_selected_entry().value
								actions.close(bufnr)
								vim.cmd("DiffviewOpen " .. branch .. "...HEAD")
							end
							map("i", "<CR>", open_diff)
							map("n", "<CR>", open_diff)
							return true
						end,
					})
				end,
				desc = "Open diffview with [b]ranch",
			},
			{
				"<leader>dC",
				function()
					local actions = require("telescope.actions")
					local action_state = require("telescope.actions.state")
					require("telescope.builtin").git_commits({
						attach_mappings = function(_, map)
							local function open_diff(bufnr)
								local hash = action_state.get_selected_entry().value
								actions.close(bufnr)
								vim.cmd("DiffviewOpen " .. hash .. "^!")
							end
							map("i", "<CR>", open_diff)
							map("n", "<CR>", open_diff)
							return true
						end,
					})
				end,
				desc = "Open diffview for [C]ommit",
			},
		},
		opts = {
			enhanced_diff_hl = true,
			view = { merge_tool = { layout = "diff3_horizontal" } },
		},
	},

	{
		"eandrju/cellular-automaton.nvim",
		keys = {
			{ "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "[M]ake it rain" },
			{ "<leader>mg", "<cmd>CellularAutomaton game_of_life<CR>", desc = "[M]ake [G]ame of life" },
			{ "<leader>ms", "<cmd>CellularAutomaton scramble<CR>", desc = "[M]ake [S]cramble" },
		},
	},
}
