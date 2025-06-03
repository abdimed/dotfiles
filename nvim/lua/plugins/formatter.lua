return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      blade = { "blade-formatter" },
      css = { "prettier" },
      vue = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
    },
    formatters = {
      ["blade-formatter"] = {
        command = vim.fn.stdpath("data") .. "/mason/bin/blade-formatter",
        args = { "--stdin" },
        stdin = true,
      },
      prettier = {
        command = vim.fn.stdpath("data") .. "/mason/bin/prettier",
        args = { "--stdin-filepath", "$FILENAME" },
        stdin = true,
      },
    },
  },
}
