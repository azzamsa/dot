# Retrieve the theme settings (Modus Vivendi)
export def main [] {
    const color_palette = {
        # Basic
        bg_main:     "#000000"
        bg_dim:      "#1e1e1e"
        fg_main:     "#ffffff"
        fg_dim:      "#989898"
        fg_alt:      "#c6daff"
        bg_active:   "#535353"
        bg_inactive: "#303030"
        border:      "#646464"

        # Accents
        red:              "#ff5f59"
        maroon:           "#cf7fa7"
        yellow:           "#d0bc00"
        yellow_cooler:    "#dfaf7a"
        green:            "#44bc44"
        teal:             "#00d3d0"
        cyan_warmer:      "#4ae2f0"
        blue:             "#2fafff"
        magenta:          "#feacd0"
        magenta_warmer:   "#f78fe7"
        magenta_cooler:   "#b6a0ff"
        pink:             "#d09dc0"
    }

    return {
        separator: $color_palette.border
        leading_trailing_space_bg: { attr: "n" }
        header: { fg: $color_palette.blue attr: "b" }
        empty: $color_palette.magenta_cooler
        bool: $color_palette.magenta_cooler
        int: $color_palette.cyan_warmer
        duration: $color_palette.fg_main
        filesize: {|e|
            if $e < 1mb {
                $color_palette.green
            } else if $e < 100mb {
                $color_palette.yellow
            } else if $e < 500mb {
                $color_palette.yellow_cooler
            } else if $e < 800mb {
                $color_palette.maroon
            } else if $e > 800mb {
                $color_palette.red
            }
        }
        datetime: {|| (date now) - $in |
            if $in < 1hr {
                $color_palette.green
            } else if $in < 1day {
                $color_palette.yellow
            } else if $in < 3day {
                $color_palette.yellow_cooler
            } else if $in < 1wk {
                $color_palette.maroon
            } else if $in > 1wk {
                $color_palette.red
            }
        }
        range: $color_palette.fg_main
        float: $color_palette.fg_main
        string: $color_palette.fg_main
        nothing: $color_palette.fg_main
        binary: $color_palette.fg_main
        'cell-path': $color_palette.fg_main
        row_index: { fg: $color_palette.magenta attr: "b" }
        record: $color_palette.fg_main
        list: $color_palette.fg_main
        block: $color_palette.fg_main
        hints: $color_palette.bg_active
        search_result: { fg: $color_palette.red bg: $color_palette.fg_main }

        shape_and: { fg: $color_palette.magenta_warmer attr: "b" }
        shape_binary: { fg: $color_palette.magenta_warmer attr: "b" }
        shape_block: { fg: $color_palette.blue attr: "b" }
        shape_bool: $color_palette.teal
        shape_custom: $color_palette.green
        shape_datetime: { fg: $color_palette.teal attr: "b" }
        shape_directory: $color_palette.teal
        shape_external: $color_palette.teal
        shape_externalarg: { fg: $color_palette.green attr: "b" }
        shape_filepath: $color_palette.teal
        shape_flag: { fg: $color_palette.blue attr: "b" }
        shape_float: { fg: $color_palette.magenta_warmer attr: "b" }
        shape_garbage: { fg: $color_palette.fg_main bg: $color_palette.red attr: "b" }
        shape_globpattern: { fg: $color_palette.teal attr: "b" }
        shape_int: { fg: $color_palette.magenta_warmer attr: "b" }
        shape_internalcall: { fg: $color_palette.teal attr: "b" }
        shape_list: { fg: $color_palette.teal attr: "b" }
        shape_literal: $color_palette.blue
        shape_match_pattern: $color_palette.green
        shape_matching_brackets: { attr: "u" }
        shape_nothing: $color_palette.teal
        shape_operator: $color_palette.yellow
        shape_or: { fg: $color_palette.magenta_warmer attr: "b" }
        shape_pipe: { fg: $color_palette.magenta_warmer attr: "b" }
        shape_range: { fg: $color_palette.yellow attr: "b" }
        shape_record: { fg: $color_palette.teal attr: "b" }
        shape_redirection: { fg: $color_palette.magenta_warmer attr: "b" }
        shape_signature: { fg: $color_palette.green attr: "b" }
        shape_string: $color_palette.green
        shape_string_interpolation: { fg: $color_palette.teal attr: "b" }
        shape_table: { fg: $color_palette.blue attr: "b" }
        shape_variable: $color_palette.magenta

        background: $color_palette.bg_main
        foreground: $color_palette.fg_main
        cursor: $color_palette.fg_main
    }
}

# Update the Nushell configuration
export def --env "set color_config" [] {
    $env.config.color_config = (main)
}

# Update terminal colors
export def "update terminal" [] {
    let theme = (main)

    let osc_screen_foreground_color = '10;'
    let osc_screen_background_color = '11;'
    let osc_cursor_color = '12;'

    $"
    (ansi -o $osc_screen_foreground_color)($theme.foreground)(char bel)
    (ansi -o $osc_screen_background_color)($theme.background)(char bel)
    (ansi -o $osc_cursor_color)($theme.cursor)(char bel)
    "
    | str replace --all "\n" ''
    | print -n $"($in)\r"
}

export module activate {
    export-env {
        set color_config
        update terminal
    }
}

use activate
