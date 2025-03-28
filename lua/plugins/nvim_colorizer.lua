return {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
        require("colorizer").setup({ "*", "!vim" }, {
        RGB = true,         -- #RGB hex codes
        RRGGBB = true,      -- #RRGGBB hex codes
        names = true,      -- Disable color names like "Blue"
        RRGGBBAA = false,   -- Disable 8-digit hex codes
        AARRGGBB = false,   -- Disable 8-digit hex codes with alpha at beginning
        css = true,         -- Enable all CSS features: rgb(), rgba(), hsl(), hsla()
        css_fn = true,      -- Enable CSS functions like rgb() and hsl()
        mode = "foreground", -- Set the display mode
        })
end,
}
