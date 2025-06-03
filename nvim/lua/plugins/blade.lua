-- ~/.config/nvim/lua/plugins/blade.lua
return {
  "jwalton512/vim-blade",
  ft = "blade", -- load only for Blade files
  config = function()
    vim.cmd([[autocmd BufRead,BufNewFile *.blade.php set filetype=blade]])
  end,
}
