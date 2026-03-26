# Auto-deploy dotfiles on terminal start
def --env dot-deploy [] {
    let old = $env.PWD
    cd ~/dot
    dotter deploy
    cd $old
}
dot-deploy

#
# Aliases
#

alias c = clear

alias in = {{ install }}
alias out = {{ uninstall }}
alias cin = cargo binstall --no-confirm --no-symlinks --secure
alias cout = cargo remove

alias .. = cd ..
alias ... = cd ../..
alias l = ls
alias la = ls -la

alias j = just


#
# Apps
#

mkdir ~/.cache/starship
mkdir ~/.local/share/atuin
mkdir ~/.cache/carapace

starship init nu | save -f ~/.cache/starship/init.nu
atuin init nu | save -f ~/.local/share/atuin/init.nu
zoxide init nushell --cmd cd | save -f ~/.local/share/zoxide/init.nu
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu


#
# Extras
#
source extras/pwds.nu

#
# Functions
#


# Toor (find project root)
def --env r [] {
    let project_root = (toor | str trim)
    if $project_root != "" {
        cd $project_root
        print $"Changed to project root: ($project_root)"
    } else {
        print "Project root not found. I don't go anywhere 📍"
    }
}

# Scratch
def x [] {
    hx $"($env.HOME)/.local/share/meta/scratch.md"
}


# Yazi
# Changing working directory when exiting Yazi https://yazi-rs.github.io/docs/quick-start/#changing-working-directory-when-exiting-yazi
def --env f [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	^yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != $env.PWD and ($cwd | path exists) {
		cd $cwd
	}
	rm -fp $tmp
}
