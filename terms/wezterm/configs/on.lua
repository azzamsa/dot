local wezterm = require("wezterm")

wezterm.on("format-tab-title", function(tab)
    local title = tab.active_pane.title
    local sep = title:find("/[^/]*$")
    if sep then
        title = title:sub(sep + 1)
    end
    return string.format("%d: %s", tab.tab_index + 1, title)
end)

return wezterm
