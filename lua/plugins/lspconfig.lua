return {
        "neovim/nvim-lspconfig",
        dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        },
        config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
            "bashls",
            "clangd",
            "omnisharp",
            "cssls",
            "html",
            "jsonls",
            "lua_ls",
            "perlnavigator",
            "phpactor",
            "pyright",
            "rust_analyzer",
            "tailwindcss",
            "vimls",
            "yamlls"
            }
        })
    
        local lspconfig = require("lspconfig")
    
        -- Setup each language server
        for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
            lspconfig[server].setup({})
        end
    end
}