return {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            -- background_colour = "#000000",
            timeout = 3000,
            fps = 60,
            icons = {
            ERROR = "",
            WARN  = "",
            INFO  = "",
            DEBUG = "",
            },
        })
    vim.notify = require("notify") -- Override default vim.notify
    end,
}