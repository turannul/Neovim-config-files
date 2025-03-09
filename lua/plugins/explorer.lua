return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({
      disable_netrw = true,
      hijack_netrw = true,
      update_focused_file = {
        enable = true,
      },
      view = {
        width = 50,
        side = "right",  -- open the tree on the right side
      },
      renderer = {
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = false,
          },
        },
      },
      filters = {
        dotfiles = false,  -- show dotfiles
      },
    })
  end,
}
