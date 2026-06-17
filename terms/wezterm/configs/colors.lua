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
        tab_bar = {
            background = "#000000",
            active_tab = { bg_color = "#000000", fg_color = "#00d3d0" },
            inactive_tab = { bg_color = "#000000", fg_color = "#989898" },
            inactive_tab_hover = { bg_color = "#000000", fg_color = "#00d3d0" },
            new_tab = { bg_color = "#000000", fg_color = "#989898" },
            new_tab_hover = { bg_color = "#000000", fg_color = "#ffffff" },
        },
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
            active_tab = { bg_color = "#000000", fg_color = "#00d3d0" },
            inactive_tab = { bg_color = "#000000", fg_color = "#989898" },
            inactive_tab_hover = { bg_color = "#000000", fg_color = "#00d3d0" },
            new_tab = { bg_color = "#000000", fg_color = "#989898" },
            new_tab_hover = { bg_color = "#000000", fg_color = "#ffffff" },
        },
    },
    ["tokyo_black"] = {
        ansi = { "#9399b2", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#ffffff" },
        brights = { "#9399b2", "#ff757f", "#c3e88d", "#ffc777", "#82aaff", "#c099ff", "#86e1fc", "#ffffff" },
        cursor_bg = "#c8d3f5",
        scrollbar_thumb = "#2f334d",
        selection_bg = "#1e1e2e",
        tab_bar = {
            background = "#000000",
            active_tab = { bg_color = "#000000", fg_color = "#c099ff" },
            inactive_tab = { bg_color = "#000000", fg_color = "#c8d3f5" },
            inactive_tab_hover = { bg_color = "#000000", fg_color = "#c099ff" },
            new_tab = { bg_color = "#000000", fg_color = "#9399b2" },
            new_tab_hover = { bg_color = "#000000", fg_color = "#ffffff" },
        },
    },
    ["catppuccin_mocha"] = {
        ansi = { "#45475a", "#f38ba8", "#a6e3a1", "#f9e2af", "#89b4fa", "#f5c2e7", "#94e2d5", "#bac2de" },
        brights = { "#585b70", "#f38ba8", "#a6e3a1", "#f9e2af", "#89b4fa", "#f5c2e7", "#94e2d5", "#a6adc8" },
        cursor_bg = "#f5e0dc",
        scrollbar_thumb = "#585b70",
        selection_bg = "#585b70",
        tab_bar = {
            background = "#000000",
            active_tab = { bg_color = "#000000", fg_color = "#cba6f7" },
            inactive_tab = { bg_color = "#000000", fg_color = "#cdd6f4" },
            inactive_tab_hover = { bg_color = "#000000", fg_color = "#cba6f7" },
            new_tab = { bg_color = "#000000", fg_color = "#585b70" },
            new_tab_hover = { bg_color = "#000000", fg_color = "#cdd6f4" },
        },
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
