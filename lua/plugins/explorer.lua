return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({
      disable_netrw = true,
      hijack_netrw = true,
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      view = {
        width = 40,
        side = "right",
        number = false,
        signcolumn = "yes",
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        full_name = true,
        highlight_opened_files = "icon",
        indent_markers = {
          enable = true,
          icons = {
            corner = "└ ",
            edge = "│ ",
            item = "│ ",
            none = "  ",
          },
        },
        icons = {
          webdev_colors = true,
          git_placement = "before",
          modified_placement = "after",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = false,
            git = true,
            modified = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            bookmark = "笠",
            modified = "●",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
          },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "package.json" },
      },
      git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        timeout = 400,
      },
      actions = {
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
        open_file = {
          quit_on_open = true,
          resize_window = true,
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
        remove_file = {
          close_window = true,
        },
        use_system_clipboard = true,
      },
      filters = {
        dotfiles = false,
        custom = { "^.git$", "^node_modules$", "^.cache$" },
        exclude = {},
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        debounce_delay = 50,
        severity = {
          min = vim.diagnostic.severity.HINT,
          max = vim.diagnostic.severity.ERROR,
        },
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      live_filter = {
        prefix = "[Searching]: ",
        always_show_folders = false,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = {},
      },
      update_cwd = true,
      reload_on_bufenter = true,
    })
  end,
}