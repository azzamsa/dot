#
# Apps
#

use ~/.cache/starship/init.nu
source ~/.local/share/atuin/init.nu
source ~/.local/share/zoxide/init.nu
source ~/.cache/carapace/init.nu

$env.config = {
    # disable the welcome banner at startup
    show_banner: false # default: true

    rm: {
        always_trash: true # default: false
    }

    history: {
        file_format: "sqlite" # default: plaintext
    }
}

$env.config.hooks.env_change = {
    HOME: [{||
        let emoji = (emojis nature)
        let quote = (quotes --period --file ~/.config/meta/quotes.txt)
        print $"(ansi magenta)($emoji) ($quote)(ansi reset)"
    }]
}


#
# Themes
#
source ~/.config/nushell/themes/{{ theme }}.nu
