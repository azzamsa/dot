set fish_greeting # no greeting

# Force true-color support; otherwise, the Neovim Terminal inside Neovide
# (not the case with Neovim inside the Terminal) will use slightly different colors,
# which is sometimes annoying and hard to read. I've been having a hard time solving this issue,
# ranging from setting `vim.g.terminal_color_n` and other approaches.
# It turns out it's an issue with the Fish shell.
# All credits due to @fredizzimo (Neovide maintainer) for finding this solution.
set -g fish_term24bit 1

# # Add directories to the beginning of the PATH variable
# set -x PATH ~/opt/bin ~/.local/bin ~/.cargo/bin $PATH
#
# # Add directories to the beginning of the PATH variable with additional directory
# set -x PATH ~/.rye/shims ~/opt/bin ~/.local/bin ~/.cargo/bin $PATH
#
# # Add directories to the beginning of the PATH variable
# set -x PATH ~/opt/nodebin/node_modules/.bin $PATH
#
# set -U SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket


#
# Bindings
#
bind \cH backward-kill-word

#
# Aliases
#

alias .. 'cd ..'
alias ... 'cd ../..'

alias c clear
alias sudo 'sudo '

alias in 'sudo dnf install'
alias out 'sudo dnf remove'

# Safe Versions of rm, cp, mv, and mkdir
alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'
alias mkdir 'mkdir -pv'

# Display PATH with each directory on a new line
alias path 'echo -e $PATH | tr ":" "\\n"'

alias j just
alias x fyazi

abbr --add crg cargo

#
# Apps
#
zoxide init fish | source
starship init fish | source
fnm env --use-on-cd | source
atuin init fish | source


#
# Functions
#

#
# ls
function l
    eza --group-directories-first --git $argv
end

function ls
    eza --group-directories-first --git $argv
end

function la
    eza --group-directories-first --git --all $argv
end

function tree
    eza --tree $argv
end


# Changing working directory when exiting Yazi
# https://yazi-rs.github.io/docs/quick-start/#changing-working-directory-when-exiting-yazi
function fyazi
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    yazi --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    # rm -f -- "$tmp"
end


#
# toolbox
function box
    if test -z $argv
        toolbox enter daily
    else
        toolbox enter $argv[1]
    end
end

#
# toor
function r # root
    set project_root (toor 2>/dev/null)

    if test -n "$project_root"
        # If successful, change to the project root directory
        cd "$project_root"
        echo "Changed to project root: $project_root"
    else
        echo "Project root not found. I dont' go anywhere 📍"
    end
end

#
# Theme
#

# See https://fishshell.com/docs/current/interactive.html#syntax-highlighting

set -l fg c8d3f5 #c8d3f5  # fg in completion page,
set -l sel 2d3f76 #2d3f76 # selection

set -l cow 86e1fc #86e1fc # command, prefix
set -l elk ff757f #ff757f # error, invalid command,
set -l puma fca7ea #fca7ea # params, (~, *),
set -l duck 636da6 #636da6 # suggestion, comment
set -l owl c3e88d #c3e88d # string
set -l bear 82aaff #82aaff # options, |

# Syntax Highlighting Colors
set -g fish_color_normal $fg
set -g fish_color_redirection $fg
set -g fish_pager_color_completion $fg

set -g fish_pager_color_description $comment
set -g fish_pager_color_progress $comment

set -g fish_color_autosuggestion $duck
set -g fish_color_comment $duck

set -g fish_color_selection --background=$sel
set -g fish_pager_color_selected_background --background=$sel
set -g fish_color_search_match --background=$sel

set -g fish_color_param $puma
set -g fish_color_operator $puma

set -g fish_color_option $bear
set -g fish_color_end $bear

set -g fish_pager_color_prefix $cow
set -g fish_color_command $cow

set -g fish_color_quote $owl
set -g fish_color_error $elk
