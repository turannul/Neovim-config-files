return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = function()
    local bigfile = require("plugins.snacks.bigfile")
    local dashboard = require("plugins.snacks.dashboard")
    local explorer = require("plugins.snacks.explorer")
    local input = require("plugins.snacks.input")
    local picker = require("plugins.snacks.picker")
    local notifier = require("plugins.snacks.notifier")
    local quickfile = require("plugins.snacks.quickfile")
    local toggle = require("plugins.snacks.toggle")
    local statuscolumn = require("plugins.snacks.statuscolumn")

    return {
      bigfile = vim.tbl_extend("force", { enabled = true }, bigfile),
      dashboard = vim.tbl_extend("force", { enabled = true }, dashboard),
      explorer = vim.tbl_extend("force", { enabled = true }, explorer),
      indent = { enabled = false },
      input = vim.tbl_extend("force", { enabled = true }, input),
      picker = vim.tbl_extend("force", { enabled = true }, picker),
      notifier = vim.tbl_extend("force", { enabled = true }, notifier),
      quickfile = vim.tbl_extend("force", { enabled = true }, quickfile),
      scope = { enabled = false },
      toggle = vim.tbl_extend("force", { enabled = true }, toggle),
      scroll = { enabled = false },
      statuscolumn = vim.tbl_extend("force", { enabled = true }, statuscolumn),
      words = { enabled = false },
    }
  end,
}