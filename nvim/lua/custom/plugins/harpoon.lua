return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local harpoon = require 'harpoon'
    local keys = {
      {
        '<leader>ha',
        function()
          harpoon:list():add()
        end,
        desc = '[H]arpoon [A]dd File',
      },
      {
        '<leader>hh',
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = '[H]arpoon Quick Menu',
      },
    }

    for i = 1, 5 do
      table.insert(keys, {
        '<leader>h' .. i,
        function()
          harpoon:list():select(i)
        end,
        desc = '[H]arpoon to File ' .. i,
      })
    end
    return keys
  end,
}
