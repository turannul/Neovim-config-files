-- Ty, Adam Whittingham for https://raw.githubusercontent.com/AdamWhittingham/vim-config/refs/heads/nvim/lua/config/plugins/alpha-nvim.lua this config based off it.
local humourLines = {
    [[╔═╗┌─┐┌┬┐┌─┐  ┬┌─┐  ┬  ┬┬┌─┌─┐  ┬ ┬┬ ┬┌┬┐┌─┐┬─┐                           ]],
    [[║  │ │ ││├┤   │└─┐  │  │├┴┐├┤   ├─┤│ │││││ │├┬┘                           ]],
    [[╚═╝└─┘─┴┘└─┘  ┴└─┘  ┴─┘┴┴ ┴└─┘  ┴ ┴└─┘┴ ┴└─┘┴└─o                          ]],
    [[╦ ╦┬ ┬┌─┐┌┐┌  ┬ ┬┌─┐┬ ┬  ┬ ┬┌─┐┬  ┬┌─┐  ┌┬┐┌─┐  ┌─┐─┐ ┬┌─┐┬  ┌─┐┬┌┐┌  ┬┌┬┐]],
    [[║║║├─┤├┤ │││  └┬┘│ ││ │  ├─┤├─┤└┐┌┘├┤    │ │ │  ├┤ ┌┴┬┘├─┘│  ├─┤││││  │ │ ]],
    [[╚╩╝┴ ┴└─┘┘└┘   ┴ └─┘└─┘  ┴ ┴┴ ┴ └┘ └─┘   ┴ └─┘  └─┘┴ └─┴  ┴─┘┴ ┴┴┘└┘  ┴ ┴┘]],
    [[                                                        ┬┌┬┐┌─┐  ┌┐ ┌─┐┌┬┐]],
    [[                                                        │ │ └─┐  ├┴┐├─┤ ││]],
    [[                                                        ┴ ┴ └─┘  └─┘┴ ┴─┴┘]],
    [[                                                                          ]],
}

local bugLines = {
    [[  _____   _                          _                 _                             ]],
    [[ |_   _| | |_    ___   _ _   ___    (_)  ___    __ _  | | __ __ __  __ _   _  _   ___]],
    [[   | |   | ' \  / -_) | '_| / -_)   | | (_-<   / _` | | | \ V  V / / _` | | || | (_-<]],
    [[   |_|   |_||_| \___| |_|   \___|   |_| /__/   \__,_| |_|  \_/\_/  \__,_|  \_, | /__/]],
    [[                                                                           |__/      ]],
    [[                                                   _                                 ]],
    [[  ___   _ _    ___     _ __    ___   _ _   ___    | |__   _  _   __ _                ]],
    [[ / _ \ | ' \  / -_)   | '  \  / _ \ | '_| / -_)   | '_ \ | || | / _` |               ]],
    [[ \___/ |_||_| \___|   |_|_|_| \___/ |_|   \___|   |_.__/  \_,_| \__, |               ]],
    [[                                                                |___/                ]],
    [[  _              __   _                                                              ]],
    [[ | |_   ___     / _| (_) __ __                                                       ]],
    [[ |  _| / _ \   |  _| | | \ \ /  _                                                    ]],
    [[  \__| \___/   |_|   |_| /_\_\ (_)                                                   ]],
}

local fixLines = {
    [[    ┌─┐┬─┐ ┬  ┌┬┐┬ ┬┌─┐  ┌─┐┌─┐┬ ┬┌─┐┌─┐      ]],
    [[    ├┤ │┌┴┬┘   │ ├─┤├┤   │  ├─┤│ │└─┐├┤       ]],
    [[    └  ┴┴ └─   ┴ ┴ ┴└─┘  └─┘┴ ┴└─┘└─┘└─┘┘     ]],
    [[╔╗╔╔═╗╔╦╗  ╔╦╗╦ ╦╔═╗  ╔═╗╦ ╦╔╦╗╔═╗╔╦╗╔═╗╔╦╗╔═╗]],
    [[║║║║ ║ ║    ║ ╠═╣║╣   ╚═╗╚╦╝║║║╠═╝ ║ ║ ║║║║╚═╗]],
    [[╝╚╝╚═╝ ╩    ╩ ╩ ╩╚═╝  ╚═╝ ╩ ╩ ╩╩   ╩ ╚═╝╩ ╩╚═╝]],
    [[                                              ]],
}

local neovim = {
    [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
    [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
    [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
    [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
    [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
    [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
}
-- todo: add more headers
local function lineColor(lines, popStart, popEnd)
    local out = {}
    for i, line in ipairs(lines) do
        local hi = "StartLogo" .. i
        if i > popStart and i <= popEnd then
            hi = "StartLogoPop" .. i - popStart
        elseif i > popStart then
            hi = "StartLogo" .. i - popStart
        else
            hi = "StartLogo" .. i
        end
        table.insert(out, { hi = hi, line = line})
    end
    return out
end

local headers = {
    lineColor(humourLines, 6, 9),
    lineColor(bugLines, 5, 10),
    lineColor(fixLines, 0, 0),
    lineColor(neovim, 0, 0),
}

local function header_chars()
    math.randomseed(os.time())
    return headers[math.random(#headers)]
end

-- Map over the headers, setting a different color for each line.
-- This is done by setting the Highligh to StartLogoN, where N is the row index.
-- Define StartLogo1..StartLogoN to get a nice gradient.

local function header_color()
    local lines = {}
    for _, lineConfig in pairs(header_chars()) do
        local hi = lineConfig.hi
        local line_chars = lineConfig.line
        local line = {
            type = "text",
            val = line_chars,
            opts = {
                hl = hi,
                shrink_margin = false,
                position = "center",
                },
            }
        table.insert(lines, line)
    end

    local output = {
        type = "group",
        val = lines,
        opts = { position = "center", },
    }

    return output
end

local function configure()
    local dashboard = require("alpha.themes.dashboard")
    local buttons = {
        type = "group",
        val = {
            { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
            { type = "padding", val = 1 },
            dashboard.button("n", "  New file", "<cmd>ene <BAR> startinsert <CR>"),
            dashboard.button("e", "  Explorer", "<cmd>NvimTreeToggle<CR>"),
            dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
            dashboard.button("m", "  Mason", "<cmd>Mason<CR>"),
            dashboard.button("q", "󰩈  Quit", "<cmd>qa!<CR>"),
            -- Todo more here...
            -- fix: show recently opened files?
            -- todo like recents?
        },
        position = "center",
    }

    local themeconfig = {
        layout = {
            header_color(),
            { type = "padding", val = 2 },
            buttons,
        },
        opts = { margin = 5 },
    }

    return themeconfig
end

return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local colors = {
            "#ff0000", "#ff5f00", "#ffbf00", -- red-orange-yellow gradient
            "#00ff00", "#00ff5f", "#00ffff", -- green-cyan-blue
            "#0000ff", "#5f00ff", "#bf00ff", -- blue-magenta-purple
            "#ff00ff", "#ff00bf", "#ff0080"  -- pink variants
        }
        
        for i, color in ipairs(colors) do
            vim.api.nvim_set_hl(0, 'StartLogo'..i, { fg = color })
            vim.api.nvim_set_hl(0, 'StartLogoPop'..i, { fg = color, bold = true })
        end

        require'alpha'.setup(configure())
    end
}
