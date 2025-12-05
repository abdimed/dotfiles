-- ===============================
-- Basic Options
-- ===============================
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers for easier navigation
vim.opt.shiftwidth = 4 -- Number of spaces for each indentation level
vim.opt.smartindent = true -- Automatically indent based on code context
vim.opt.breakindent = true -- Align wrapped lines with the original line's indent
vim.opt.signcolumn = "yes" -- Always show sign column to avoid layout shifts
vim.opt.wrap = false -- Disable line wrapping for long lines
vim.opt.termguicolors = true -- Enable 24-bit RGB color support for better colors
vim.opt.clipboard = "unnamedplus" -- Sync clipboard with system clipboard
vim.opt.ignorecase = true -- Make searches case-insensitive...
vim.opt.smartcase = true -- ...unless the search contains capital letters
vim.opt.undofile = true -- Enable persistent undo across sessions
vim.opt.mouse = "a" -- Enable mouse support in all modes (normal, visual, insert, etc.)
vim.opt.showmode = false -- Hide mode display (e.g., --INSERT--) in command line
vim.opt.tabstop = 4 -- Number of spaces a tab character represents
vim.opt.cursorline = true -- Highlight the line where the cursor is located
vim.opt.cursorlineopt = "both"
vim.opt.confirm = true -- Prompt for confirmation when closing unsaved buffers
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ===============================
-- Leader Key
-- ===============================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ===============================
-- Core Keymaps (Built-in functionality)
-- ===============================
-- Arrow key reminders
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Center screen on search
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Line movement
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- File operations
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "[W]rite file" })

-- Clear search highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Window resizing (more intuitive)
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Terminal
vim.keymap.set("n", "<leader>t", function()
	vim.cmd("split")
	vim.cmd("wincmd J") -- Move window to bottom
	vim.cmd("terminal")
	vim.cmd("resize 15")
end, { desc = "[T]erminal toggle (horizontal split)" })

-- ===============================
-- Buffer Commands
-- ===============================
-- Buffer navigation
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "[B]uffer [N]ext" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "[B]uffer [P]revious" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "[B]uffer [D]elete" })
vim.keymap.set("n", "<leader>bD", "<cmd>bdelete!<cr>", { desc = "[B]uffer [D]elete (force)" })

-- Alternative buffer navigation (Tab-style)
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Buffer management
vim.keymap.set("n", "<leader>ba", "<cmd>%bd|e#<cr>", { desc = "[B]uffer delete [A]ll others" })
vim.keymap.set("n", "<leader>bl", "<cmd>ls<cr>", { desc = "[B]uffer [L]ist" })
vim.keymap.set("n", "<leader>bo", "<cmd>%bd|e#<cr>", { desc = "[B]uffer [O]nly (delete others)" })

vim.keymap.set("v", "<leader>a", ":'<,'>!column -t<CR>", { noremap = true, silent = true, desc = "[A]lign columns" })

-- Quick buffer switching (numbered)
for i = 1, 9 do
	vim.keymap.set("n", "<leader>b" .. i, "<cmd>buffer " .. i .. "<cr>", { desc = "Go to buffer " .. i })
end

-- ===============================
-- Autocommands
-- ===============================
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
	end,
})

-- ===============================
-- Plugin Manager: lazy.nvim
-- ===============================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local ok, err = pcall(vim.fn.system, {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
	if not ok then
		vim.notify("Failed to install lazy.nvim: " .. err, vim.log.levels.ERROR)
	end
end
vim.opt.rtp:prepend(lazypath)

-- ===============================
-- Install Plugins
-- ===============================
require("lazy").setup({
	-- /lua/plugins
	{ import = "plugins" },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			-- Core telescope mappings
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffer" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
			vim.keymap.set("n", "<leader><leader>", function()
				require("telescope.builtin").buffers({
					sort_lastused = true,
					ignore_current_buffer = true,
					previewer = true,
				})
			end, { desc = "[F]ind [B]uffer" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind [W]ord under cursor" })
			-- Special find operations
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
				vim.cmd("Telescope find_files cwd=~/.config/nvim")
			end, { desc = "[F]ind [N]eovim files" })

			vim.keymap.set("n", "<leader>fR", function()
				require("telescope.builtin").resume()
			end, { desc = "[F]ind [R]esume" })

			vim.keymap.set("n", "<leader>fr", function()
				require("telescope.builtin").oldfiles()
			end, { desc = "[F]ind [r]ecent" })

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- Git operations
			vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "[G]it [F]iles" })
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "[G]it [C]ommits" })
			vim.keymap.set("n", "<leader>gB", builtin.git_branches, { desc = "[G]it [B]ranches" })
		end,
	},

	-- Treesitter
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"lua",
					"php",
					"html",
					"css",
					"javascript",
					"typescript",
					"json",
					"markdown",
					"markdown_inline",
					"vim",
					"vimdoc",
				},
				highlight = { enable = true, additional_vim_regex_highlighting = false },
				indent = { enable = true },
				sync_install = false,
				additional_vim_regex_highlighting = false,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
				},
			})
		end,
	},

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	-- Focus modes
	{
		"folke/zen-mode.nvim",
		keys = {
			{ "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle ZenMode" },
		},
		opts = {},
	},

	{
		"folke/twilight.nvim",
		keys = {
			{ "<leader>ut", "<cmd>Twilight<cr>", desc = "Toggle Twilight" },
		},
		opts = {},
	},

	-- LSP setup
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			-- ===============================
			-- Capabilities
			-- ===============================
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- ===============================
			-- Define your servers here
			-- ===============================
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							completion = { callSnippet = "Replace" },
							diagnostics = { disable = { "missing-fields" } },
						},
					},
				},
				ts_ls = {}, -- Example for TypeScript
				gopls = {}, -- Example for Go
			}

			-- ===============================
			-- LSP Keymaps + Attach events
			-- ===============================
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data and event.data.client_id)
					-- Safe document highlight
					if client and client.server_capabilities.documentHighlightProvider then
						local highlight_group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_group,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_group,
							callback = vim.lsp.buf.clear_references,
						})
					end

					-- LSP Keymaps
					vim.keymap.set(
						"n",
						"gd",
						vim.lsp.buf.definition,
						{ buffer = event.buf, noremap = true, silent = true, desc = "Go to definition" }
					)
					-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set(
						"n",
						"<leader>r",
						vim.lsp.buf.rename,
						{ buffer = event.buf, noremap = true, silent = true, desc = "Rename" }
					)
					vim.keymap.set(
						"n",
						"<leader>ca",
						vim.lsp.buf.code_action,
						{ buffer = event.buf, noremap = true, silent = true, desc = "[C]ode [a]ction" }
					)
					vim.keymap.set(
						"n",
						"[d",
						vim.diagnostic.goto_prev,
						{ buffer = event.buf, desc = "Previous diagnostic" }
					)
					vim.keymap.set(
						"n",
						"]d",
						vim.diagnostic.goto_next,
						{ buffer = event.buf, desc = "Next diagnostic" }
					)
					vim.keymap.set(
						"n",
						"<leader>q",
						vim.diagnostic.open_float,
						{ buffer = event.buf, desc = "Show diagnostic" }
					)
					vim.keymap.set(
						"n",
						"<leader>Q",
						vim.diagnostic.setloclist,
						{ buffer = event.buf, desc = "Diagnostics to quickfix list" }
					)
				end,
			})

			-- ===============================
			-- Diagnostics config
			-- ===============================
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					prefix = "●",
					format = function(diagnostic)
						return diagnostic.message
					end,
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = {},
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	-- Formatter

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
					php = { "intelephense" },
					blade = { "blade-formatter" },
					json = { "prettier" },
				},
				-- format_on_save = function(_)
				-- 	return {
				-- 		timeout_ms = 500,
				-- 		lsp_format = false,
				-- 	}
				-- end,
			})

			-- Keymap for manual formatting
			vim.keymap.set({ "n", "v" }, "<leader>bf", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end, { desc = "Format file" })
		end,
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

	-- { "nvim-tree/nvim-web-devicons", opts = {} },

	{ -- Collection of various small independent plugins/modules
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
				["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
			},
			filetype = {
				dotenv = { glyph = "", hl = "MiniIconsYellow" },
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
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next Todo Comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous Todo Comment",
			},
			{ "<leader>fT", "<cmd>TodoTelescope<cr>", desc = "Todo" },
			{ "<leader>ft", "<cmd>TodoTelescope keywords=TODO<cr>", desc = "Todo" },
		},
	},

	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>cD",
				"<cmd>Trouble diagnostics toggle focus=true<cr>",
				desc = "[C]ode [D]iagnostics (All)",
			},
			{
				"<leader>cd",
				"<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
				desc = "[C]ode [d]iagnostics (Buffer)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=true win.position=right win.size=80<cr>",
				desc = "[C]ode [s]ymbols",
			},
			{
				"<leader>cr",
				"<cmd>Trouble lsp toggle focus=true win.position=right win.size=80<cr>",
				desc = "[C]ode [r]eferences",
			},
		},
	},

	{
		"nvim-telescope/telescope-project.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
	},

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{
				"gs",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"gS",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
		},
	},

	-- Autocomplete AI
	-- {
	-- 	"supermaven-inc/supermaven-nvim",
	-- 	config = function()
	-- 		require("supermaven-nvim").setup({})
	-- 	end,
	-- },

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>",
					},
					layout = {
						position = "bottom",
						ratio = 0.4,
					},
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
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = "node",
				server_opts_overrides = {},
			})
		end,
	},

	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "Open diffview (HEAD vs working dir)" },
			{ "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
			{ "<leader>dh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history (current file)" },
			{ "<leader>dH", "<cmd>DiffviewFileHistory<cr>", desc = "File history (repo)" },
		},
		config = function()
			require("diffview").setup({
				enhanced_diff_hl = true,
				view = {
					merge_tool = { layout = "diff3_horizontal" },
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		lazy = true,
		event = { "BufReadPost", "BufNewFile" }, -- load only when opening files
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesitter-context").setup({
				enable = true, -- enable by default
				max_lines = 3, -- max lines of context
				trim_scope = "outer",
				min_window_height = 0, -- no minimum window height
				mode = "cursor", -- cursor determines context (or "topline")
				zindex = 20, -- floating window z-index
			})
		end,
	},

	{
		"mg979/vim-visual-multi",
		branch = "master",
	},

	{
		"eandrju/cellular-automaton.nvim",
		config = function()
			vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "[M]ake it rain" })
			vim.keymap.set(
				"n",
				"<leader>mg",
				"<cmd>CellularAutomaton game_of_life<CR>",
				{ desc = "[M]ake [G]ame of life" }
			)
			vim.keymap.set("n", "<leader>ms", "<cmd>CellularAutomaton scramble<CR>", { desc = "[M]ake [S]cramble" })
		end,
	},

	-- ColorScheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		commit = "cb5665990a797b102715188e73c44c3931b3b42e",
		opts = {
			transparent_background = false,
			term_colors = true,
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
		},
	},

	{ "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },

	{ "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},

	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
	},

	"shaunsingh/nord.nvim",
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").load()
		end,
	},
})

vim.cmd.colorscheme("rose-pine")
