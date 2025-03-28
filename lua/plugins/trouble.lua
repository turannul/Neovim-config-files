return {
    "folke/trouble.nvim",
    event = "LspAttach",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        icons = true,
        use_diagnostic_signs = false,
        signs = {
            error = "fg",
            warning = "",
            hint = "",
            information = "",
        },
        mode = "workspace_diagnostics",
        auto_open = false,
        auto_close = false,
    },
    config = function(_, opts)
        require("trouble").setup(opts)
        vim.diagnostic.config({
        virtual_text = {
            prefix = "",
            spacing = -1,-- 4,   -- Adjust spacing as needed
            severity_sort = true,
            format = function(diagnostic)
                local icons = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN]  = "",
                    [vim.diagnostic.severity.INFO]  = "",
                    [vim.diagnostic.severity.HINT]  = "",
                }
                local icon = icons[diagnostic.severity] or ""
                -- return string.format("%s %s", icon, diagnostic.message) -- Show severity icon and message
                return string.format("%s", diagnostic.message) -- Only show the message
            end,
        },
        float = { border = "rounded" },
        signs = true,
        underline = false,
        update_in_insert = true,  -- Show diagnostics as you type
    })
    end,
}