return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
    require("lsp_lines").setup()
    vim.diagnostic.config({
        virtual_text = false,
        update_in_insert = true,
        severity_sort = false,
        float = { border = "rounded" },
        underline = false,
    })
    end
}