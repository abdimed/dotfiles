return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = { sidebars = "transparent", floats = "transparent" },
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		commit = "cb5665990a797b102715188e73c44c3931b3b42e",
		opts = {
			transparent_background = false,
			term_colors = true,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
			},
		},
	},
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true },
	{ "rose-pine/neovim", name = "rose-pine", lazy = true, opts = { transparent = true } },
	{ "Mofiqul/dracula.nvim", name = "dracula", lazy = true },
	{ "shaunsingh/nord.nvim", lazy = true },
	{ "AlexvZyl/nordic.nvim", lazy = true, config = function() require("nordic").load() end },
	{ "loctvl842/monokai-pro.nvim", lazy = true, config = function() require("monokai-pro").setup() end },
}
