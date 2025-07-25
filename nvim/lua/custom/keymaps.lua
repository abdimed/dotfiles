return {
  vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<cmd>w<cr>', { desc = 'Save file' }),
  vim.keymap.set('n', '<leader>gb', function()
    require('gitsigns').toggle_current_line_blame()
  end, { desc = 'Toggle Git Blame' }),
  vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer' }),
  vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous buffer' }),
  vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete current buffer' }),
  vim.keymap.set('n', '<leader>gt', function()
    require('gitsigns').toggle_signs()
  end, { desc = 'Toggle Git Signs' }),

  vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' }),
  vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' }),
  vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' }),
  vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' }),
}
