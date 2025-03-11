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
      },
      window = {
        position = "right",
        width = 45,
        mappings = { ["<C-e>"] = "close_window" }
      },
      source_selector = { winbar = true, content_layout = "center" }
    })
  end,
  init = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      group = vim.api.nvim_create_augroup("NeoTreeInit", { clear = true }),
      callback = function()
        local stats = vim.loop.fs_stat(vim.fn.argv(0))
        if stats and stats.type == "directory" then
          require("neo-tree").close_all()
          require("neo-tree").show({ position = "right", reveal_force_cwd = true })
        end
      end
    })
  end,
}
