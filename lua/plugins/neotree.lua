return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    event = { "VeryLazy" },
    position = "right",
    keys = {
      {
        "<leader>e",
        "<Cmd> Neotree toggle reveal_force_cwd <CR>",
        desc = "File Explorer",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = true })
        end,
        desc = "Git Explorer",
      },
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    dependencies = {
      { "MunifTanjim/nui.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    init = function()
      vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("NeOTree_Begin", { clear = true }),
        once = true,
        callback = function()
          if package.loaded["neo-tree"] then
            return
          else
            local stats = vim.uv.fs_stat(vim.fn.argv(0))
            if stats and stats.type == "directory" then
              require("neo-tree")
            end
          end
        end,
      })
    end,
  }, -- File Explorer
}