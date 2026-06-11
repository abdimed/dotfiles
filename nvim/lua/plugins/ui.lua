return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	{
		"folke/which-key.nvim",
		event = "VimEnter",
		opts = {
			delay = 0,
			preset = "helix",
			spec = {
				{ "<leader>c", group = "[C]ode" },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>g", group = "[G]it" },
				{ "<leader>f", group = "[F]ind" },
				{ "<leader>b", group = "[B]uffer" },
				{ "<leader>x", group = "E[x]tras" },
				{ "<leader>u", group = "[U]i" },
				{ "<leader>d", group = "[D]iff" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>e", ":Neotree toggle<CR>", desc = "Toggle Neo-tree" },
			{ "<leader>be", ":Neotree focus<CR>", desc = "Focus Neo-tree" },
		},
		opts = {
			close_if_last_window = true,
			filesystem = {
				filtered_items = { visible = true },
				follow_current_file = { enabled = true },
			},
		},
	},

	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-mini/mini.icons" },
		opts = {
			options = {
				mode = "buffers",
				diagnostics = "nvim_lsp",
				show_buffer_close_icons = true,
				show_close_icon = false,
				separator_style = "thin",
			},
		},
	},

	{
		"folke/zen-mode.nvim",
		keys = { { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" } },
		opts = {},
	},

	{
		"folke/twilight.nvim",
		keys = { { "<leader>ut", "<cmd>Twilight<cr>", desc = "Toggle Twilight" } },
		opts = {},
	},
}
