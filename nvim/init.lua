require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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

local lazy_spec = { { import = "plugins" } }
if vim.uv.fs_stat(vim.fn.stdpath("config") .. "/lua/local") then
	table.insert(lazy_spec, { import = "local" })
end
require("lazy").setup(lazy_spec)

vim.cmd.colorscheme("tokyonight")

-- Machine-local overrides (gitignored)
local local_config = vim.fn.stdpath("config") .. "/local.lua"
if vim.uv.fs_stat(local_config) then
	dofile(local_config)
end
