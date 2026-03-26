let theme = {
  bg_main:              "#000000"
  bg_dim:               "#1e1e1e"
  bg_active:            "#535353"
  bg_inactive:          "#303030"
  bg_region:            "#5a5a5a"
  border:               "#646464"
  fg_main:              "#ffffff"
  fg_dim:               "#989898"
  fg_alt:               "#c6daff"

  red:                  "#ff7f86"
  red_faint:            "#ff9580"
  yellow:               "#d0bc00"
  yellow_warmer:        "#fec43f"
  green:                "#44bc44"
  cyan:                 "#00d3d0"
  cyan_cooler:          "#6ae4b9"
  cyan_warmer:          "#4ae2f0"
  blue_cooler:          "#00bcff"
  blue_warmer:          "#79a8ff"
  magenta:              "#feacd0"
  magenta_cooler:       "#b6a0ff"
  magenta_warmer:       "#f78fe7"
}

let scheme = {
  recognized_command:   $theme.cyan
  unrecognized_command: $theme.fg_main
  constant:             $theme.yellow_warmer
  punctuation:          $theme.fg_dim
  operator:             $theme.cyan_warmer
  string:               $theme.green
  virtual_text:         $theme.border
  variable:             { fg: $theme.red_faint attr: i }
  filepath:             $theme.yellow
}

$env.config.color_config = {
  separator:                  { fg: $theme.border attr: b }
  leading_trailing_space_bg:  { fg: $theme.magenta_cooler attr: u }
  header:                     { fg: $theme.fg_main attr: b }
  row_index:                  $scheme.virtual_text
  record:                     $theme.fg_main
  list:                       $theme.fg_main
  hints:                      $theme.fg_dim
  search_result:              { fg: $theme.bg_main bg: $theme.yellow }
  shape_closure:              $theme.cyan_cooler
  closure:                    $theme.cyan_cooler
  shape_flag:                 { fg: $theme.red_faint attr: i }
  shape_matching_brackets:    { attr: u }
  shape_garbage:              $theme.red
  shape_keyword:              $theme.magenta_cooler
  shape_match_pattern:        $theme.magenta
  shape_signature:            $theme.cyan_cooler
  shape_table:                $scheme.punctuation
  cell-path:                  $scheme.punctuation
  shape_list:                 $scheme.punctuation
  shape_record:               $scheme.punctuation
  shape_vardecl:              $scheme.variable
  shape_variable:             $scheme.variable
  empty:                      { attr: n }
  filesize: {||
    if $in < 1kb       { $theme.cyan_cooler }
    else if $in < 10kb { $theme.green }
    else if $in < 100kb{ $theme.yellow }
    else if $in < 10mb { $theme.yellow_warmer }
    else if $in < 100mb{ $theme.red_faint }
    else if $in < 1gb  { $theme.red }
    else               { $theme.magenta_cooler }
  }
  duration: {||
    if $in < 1day       { $theme.cyan_cooler }
    else if $in < 1wk   { $theme.green }
    else if $in < 4wk   { $theme.yellow }
    else if $in < 12wk  { $theme.yellow_warmer }
    else if $in < 24wk  { $theme.red_faint }
    else if $in < 52wk  { $theme.red }
    else                { $theme.magenta_cooler }
  }
  datetime: {|| (date now) - $in |
    if $in < 1day       { $theme.cyan_cooler }
    else if $in < 1wk   { $theme.green }
    else if $in < 4wk   { $theme.yellow }
    else if $in < 12wk  { $theme.yellow_warmer }
    else if $in < 24wk  { $theme.red_faint }
    else if $in < 52wk  { $theme.red }
    else                { $theme.magenta_cooler }
  }
  shape_external:             $scheme.unrecognized_command
  shape_internalcall:         $scheme.recognized_command
  shape_external_resolved:    $scheme.recognized_command
  shape_block:                $scheme.recognized_command
  block:                      $scheme.recognized_command
  shape_custom:               $theme.magenta
  custom:                     $theme.magenta
  background:                 $theme.bg_main
  foreground:                 $theme.fg_main
  cursor:                     { bg: $theme.fg_main fg: $theme.bg_main }
  shape_range:                $scheme.operator
  range:                      $scheme.operator
  shape_pipe:                 $scheme.operator
  shape_operator:             $scheme.operator
  shape_redirection:          $scheme.operator
  glob:                       $scheme.filepath
  shape_directory:            $scheme.filepath
  shape_filepath:             $scheme.filepath
  shape_glob_interpolation:   $scheme.filepath
  shape_globpattern:          $scheme.filepath
  shape_int:                  $scheme.constant
  int:                        $scheme.constant
  bool:                       $scheme.constant
  float:                      $scheme.constant
  nothing:                    $scheme.constant
  binary:                     $scheme.constant
  shape_nothing:              $scheme.constant
  shape_bool:                 $scheme.constant
  shape_float:                $scheme.constant
  shape_binary:               $scheme.constant
  shape_datetime:             $scheme.constant
  shape_literal:              $scheme.constant
  string:                     $scheme.string
  shape_string:               $scheme.string
  shape_string_interpolation: $theme.red_faint
  shape_raw_string:           $scheme.string
  shape_externalarg:          $scheme.string
}
$env.config.highlight_resolved_externals = true
$env.config.explore = {
  status_bar_background: { fg: $theme.fg_main,   bg: $theme.bg_dim },
  command_bar_text:      { fg: $theme.fg_main },
  highlight:             { fg: $theme.bg_main,   bg: $theme.yellow },
  status: {
    error: $theme.red,
    warn:  $theme.yellow_warmer,
    info:  $theme.blue_warmer,
  },
  selected_cell: { bg: $theme.blue_warmer fg: $theme.bg_main },
}
