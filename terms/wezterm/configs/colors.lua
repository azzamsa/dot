local M = {}

M.color_schemes = {
    ["modus_vivendi"] = {
        ansi = {
            -- Comments taken from Catppuccin Mocha Overlay2 will be kept across themes
            "#989898", -- comments: jj comment,
            "#ff5f59", -- error
            "#44bc44", -- executables (files), jj bookmark, atuin duration
            "#fec43f", -- specific files, prompt duration, jj author
            "#b6a0ff", -- directories (file), atuin time
            "#feacd0", -- prompt: git branch
            "#00d3d0", -- prompt: dir/project name
            "#ffffff", -- fallback files lla,
        },
        -- Use same color for `brights`. I want a holistic exeperience.
        brights = { "#989898", "#ff5f59", "#44bc44", "#fec43f", "#b6a0ff", "#feacd0", "#00d3d0", "#ffffff" },
        cursor_bg = "#ff66ff",
    },
    ["tokyonight_moon"] = {
        ansi = { "#9399b2", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#ffffff" },
        brights = { "#9399b2", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#ffffff" },
        cursor_bg = "#86e1fc",
    },
}

function M.append(config)
    local options = {
        color_schemes = M.color_schemes,
        color_scheme = "{{ theme }}",
        colors = {
            -- All the colors below are kept across theme.
            -- Mostly taken from https://catppuccin.com/palette mocha.
            foreground = "#ffffff",
            background = "#000000",
            scrollbar_thumb = "#1d2235",
            --  #1e1e2e (Catpuccin Mocha Base)
            selection_bg = "#1e1e2e",
        },
    }

    for key, value in pairs(options) do
        config[key] = value
    end
end

return M
