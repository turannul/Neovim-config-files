return {
  "nvim-neo-tree/neo-tree.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>e", "<Cmd>Neotree toggle reveal_force_cwd<CR>", desc = "File Explorer" },
    { "<leader>E", function() require("neo-tree.command").execute({ source = "git_status", toggle = true }) end, desc = "Git Explorer" },
  },
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = { hide_dotfiles = false, hide_gitignored = false },
        bind_to_cwd = true,
        follow_current_file = true,
        use_libuv_file_watcher = true,
        leave_dirs_open = true
      },
      window = {
        position = "right",
        width = 45,
        mappings = { ["<C-e>"] = "close_window" }
      },
      --source_selector = { winbar = true, content_layout = "center" }
    })
  end
}
