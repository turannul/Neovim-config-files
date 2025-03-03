return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
            "bash", "c", "c_sharp", "cmake", "comment", "cpp", "css", "csv", "diff",
            "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
            "html", "http", "json", "lua", "make", "nginx", "objc", "passwd", "pem",
            "perl", "php", "printf", "properties", "python", "regex", "ruby", "rust",
            "sql", "ssh_config", "toml", "tsx", "typescript", "vim", "yaml"
            },
        highlight = { enable = true },
        indent = { enable = true },
        })
    end
}