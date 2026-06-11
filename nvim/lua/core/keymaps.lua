-- Arrow key reminders
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Search
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

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

-- Window resizing
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- File operations
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "[W]rite file" })

-- Indenting
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Column align
vim.keymap.set("v", "<leader>a", ":'<,'>!column -t<CR>", { noremap = true, silent = true, desc = "[A]lign columns" })

-- Terminal toggle
vim.keymap.set("n", "<leader>t", function()
	local term_buf = vim.g._term_buf
	local term_win = vim.g._term_win
	if term_win and vim.api.nvim_win_is_valid(term_win) then
		vim.api.nvim_win_hide(term_win)
		vim.g._term_win = nil
	elseif term_buf and vim.api.nvim_buf_is_valid(term_buf) then
		vim.cmd("split")
		vim.cmd("wincmd J")
		vim.cmd("resize 15")
		vim.g._term_win = vim.api.nvim_get_current_win()
		vim.api.nvim_win_set_buf(vim.g._term_win, term_buf)
	else
		vim.cmd("split")
		vim.cmd("wincmd J")
		vim.cmd("terminal")
		vim.cmd("resize 15")
		vim.g._term_buf = vim.api.nvim_get_current_buf()
		vim.g._term_win = vim.api.nvim_get_current_win()
	end
end, { desc = "[T]erminal toggle" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Buffer navigation
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "[B]uffer [N]ext" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "[B]uffer [P]revious" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "[B]uffer [D]elete" })
vim.keymap.set("n", "<leader>bD", "<cmd>bdelete!<cr>", { desc = "[B]uffer [D]elete (force)" })
vim.keymap.set("n", "<leader>ba", "<cmd>%bd|e#<cr>", { desc = "[B]uffer delete [A]ll others" })
vim.keymap.set("n", "<leader>bl", "<cmd>Telescope buffers<cr>", { desc = "[B]uffer [L]ist" })
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

for i = 1, 9 do
	vim.keymap.set("n", "<leader>b" .. i, "<cmd>buffer " .. i .. "<cr>", { desc = "Go to buffer " .. i })
end

-- Colorscheme cycling
local colorschemes = nil
local cs_index = 1

local function get_colorschemes()
	if not colorschemes then
		colorschemes = vim.fn.getcompletion("", "color")
		for i, name in ipairs(colorschemes) do
			if name == vim.g.colors_name then
				cs_index = i
				break
			end
		end
	end
	return colorschemes
end

vim.keymap.set("n", "<leader>un", function()
	local css = get_colorschemes()
	cs_index = cs_index % #css + 1
	pcall(vim.cmd, "colorscheme " .. css[cs_index])
	vim.notify("Colorscheme: " .. css[cs_index])
end, { desc = "[U]I Next colorscheme" })

vim.keymap.set("n", "<leader>up", function()
	local css = get_colorschemes()
	cs_index = (cs_index - 2 + #css) % #css + 1
	pcall(vim.cmd, "colorscheme " .. css[cs_index])
	vim.notify("Colorscheme: " .. css[cs_index])
end, { desc = "[U]I Previous colorscheme" })
