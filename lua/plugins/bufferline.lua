return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("bufferline").setup {
            options = {
                mode = "buffers",
                diagnostics = "nvim_lsp",
                separator_style = "slant",
                show_buffer_icons = true,
                show_buffer_close_icons = false,
                show_close_icon = false,
                always_show_bufferline = true,
                enforce_regular_tabs = false,
                numbers = "none",
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " "
                            or (e == "warning" and " " or " ")
                        s = s .. n .. sym
                    end
                    return s
                end,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "center",
                    },
                },
            },
        }

    vim.keymap.set("n", "<leader>w", "<cmd>bdelete<CR>", { desc = "Close current buffer" }) -- Close buffer
    vim.keymap.set("n", "<leader>[", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" }) -- Move left
    vim.keymap.set("n", "<leader>]", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" }) -- Move right
        
    for i = 1, 9 do
        vim.keymap.set('n', '<leader>' .. i, function()
            require("bufferline").go_to_buffer(i, true)
        end, { desc = 'Switch to buffer ' .. i })
    end
end,
}