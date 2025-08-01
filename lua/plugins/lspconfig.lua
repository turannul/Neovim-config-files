return {
    "neovim/nvim-lspconfig",
    dependencies = {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim"},
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {"autotools_ls", "cmake", "gh_actions_ls", "bashls", "clangd", "omnisharp", "cssls", "html", "jsonls", "lua_ls", "perlnavigator", "phpactor", "pyright", "rust_analyzer", "tailwindcss", "vimls", "yamlls"}
        })

        for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
            require("lspconfig")[server].setup({})
        end
    end
}
