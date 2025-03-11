return {
    "Djancyp/better-comments.nvim",
    config = function()
        require("better-comment").Setup({
            tags = {
                {
                    name = "TODO",
                    fg = "#FFD700", -- Gold
                    bg = "",
                },
                {
                    name = "todo",
                    fg = "#FFD700", -- Gold
                    bg = "",
                },
                {
                    name = "FIX",
                    fg = "#FF4500", -- OrangeRed
                    bg = "",
                },
                {
                    name = "fix",
                    fg = "#FF4500", -- OrangeRed
                    bg = "",
                },
                {
                    name = "NOTE",
                    fg = "#1E90FF", -- DodgerBlue
                    bg = "",
                },
                {
                    name = "note",
                    fg = "#1E90FF", -- DodgerBlue
                    bg = "",
                },
                {
                    name = "BUG",
                    fg = "#DC143C", -- Crimson
                    bg = "",
                },
                {
                    name = "bug",
                    fg = "#DC143C", -- Crimson
                    bg = "",
                },
                {
                    name = "x",
                    fg = "#32CD32", -- LimeGreen
                    bg = "",
                },
                {
                    name = "!",
                    fg = "#FF6347", -- Tomato
                    bg = "",
                },
                {
                    name = "?",
                    fg = "#4B0082", -- Indigo
                    bg = "",
                },
                {
                    name = "//",
                    fg = "#696969", -- DimGray
                    bg = "",
                },
                {
                    name = "*",
                    fg = "#8A2BE2", -- BlueViolet
                    bg = "",
                },
            },
        })
    end
}
-- TODO Showing here how gonna look like.
-- todo Showing here how gonna look like.
-- fix Showing here how gonna look like.
-- FIX Showing here how gonna look like.
-- note Showing here how gonna look like.
-- NOTE Showing here how gonna look like.
-- bug Showing here how gonna look like.
-- BUG Showing here how gonna look like.
-- x Showing here how gonna look like.
-- ! Showing here how gonna look like.
-- ? Showing here how gonna look like.