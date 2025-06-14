return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                                   ]],
      },
      sections = {
        { section = "header" },
        {
          section = "keys",
          gap = 1,
          padding = 1,
        },
        -- {
        -- pane = 2,
        -- {
        --   section = "terminal",
        --   cmd = "ascii-image-converter  ~/Pictures/theoffice.gif  -b  --threshold 10 -C -f",
        --   height = 20,
        --   padding = 1,
        -- },
        -- {
        --   section = "terminal",
        --   cmd = "chafa ~/Pictures/wcat.avif --format symbols --symbols vhalf --align center,center ; sleep .1",
        --   height = 28,
        --   padding = 1,
        -- },
        -- {
        --   section = "terminal",
        --   cmd = "git log --oneline -10 2>/dev/null || echo 'Not a git repository'",
        --   height = 12,
        --   padding = 1,
        --   title = "📜 Recent Commits",
        -- },
        -- {
        --   section = "recent_files",
        --   limit = 8,
        --   padding = 1,
        --   title = "📁 Recent Files",
        -- },
        -- {
        --   section = "projects",
        --   limit = 8,
        --   padding = 1,
        --   title = "🚀 Projects",
        -- },
        -- },
        {
          section = "startup",
          padding = 1,
        },
      },
      -- Enhanced styling
      win = {
        style = "minimal",
        backdrop = 60,
        keys = {
          q = "close",
          ["<esc>"] = "close",
        },
      },
    },
  },
}
