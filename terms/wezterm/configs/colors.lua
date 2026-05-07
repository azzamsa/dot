local M = {}

M.color_schemes = {
    ["modus_vivendi"] = {
        ansi = {
            "#989898", -- comments: jj comment,
            "#ff5f59", -- error
            "#44bc44", -- executables (files), jj bookmark, atuin duration
            "#fec43f", -- specific files, prompt duration, jj author
            "#b6a0ff", -- directories (file), atuin time
            "#feacd0", -- prompt: git branch
            "#00d3d0", -- prompt: dir/project name
            "#ffffff", -- fallback files lla,
        },
        brights = { "#989898", "#ff5f59", "#44bc44", "#fec43f", "#b6a0ff", "#feacd0", "#00d3d0", "#ffffff" },
        cursor_bg = "#ffffff",
        scrollbar_thumb = "#4a4f69",
        selection_bg = "#555a66",
    },
    ["modus_vivendi_tinted"] = {
        ansi = {
            "#989898",
            "#ff5f59",
            "#44bc44",
            "#fec43f",
            "#b6a0ff",
            "#feacd0",
            "#00d3d0",
            "#ffffff",
        },
        brights = { "#989898", "#ff5f59", "#44bc44", "#fec43f", "#b6a0ff", "#feacd0", "#00d3d0", "#ffffff" },
        cursor_bg = "#ff66ff",
        scrollbar_thumb = "#4a4f69",
        selection_bg = "#555a66",
        tab_bar = {
            background = "#000000",
        },
    },
    ["tokyonight_moon"] = {
        ansi = { "#9399b2", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#ffffff" },
        brights = { "#9399b2", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#ffffff" },
        cursor_bg = "#86e1fc",
        scrollbar_thumb = "#1d2235",
        selection_bg = "#1e1e2e",
    },
}

function M.append(config)
    config.color_schemes = M.color_schemes
    config.color_scheme = "{{ theme }}"
    config.colors = {
        foreground = "#ffffff",
        background = "#000000",
    }
end

return M
