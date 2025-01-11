# SET QUICK ZSH EDIT
zshrc_dir=$(dirname "${(%):-%x}")
export PATH=$PATH:~/.proto/shims
export PATH=$PATH:~/custom_scripts

# SOURCE HIDDEN ENV VARS
source "${zshrc_dir}/.zshenv"

# SET VARS
# export XDG_CONFIG_HOME=/home/quaidr/.config/
# export I3_CONFIG_DIR=/home/quaidr/.i3/
# export ALACRITTY_CONFIG_DIR="~/.config/alacritty/"
export PRJ="/home/quaidr/Projects/"

# Map Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l to arrow keys
# bindkey -s '^j' '^[[B'
# bindkey -s '^k' '^[[A'
# bindkey -s '^h' '^[[D'
# bindkey -s '^l' '^[[C'

# Map Alt-Q to exit
# k


# bindkey -v    to enable vi mapping
# ALIAS
alias v="nvim"
alias sv="sudo -E -s nvim"
alias ll="ls --color=auto -la"
alias find_font="cat ~/Desktop/nerd_fonts_reference.txt | grep"

nv() {
    result=""
    if [ -z "$1" ]; then
        result=$(project_tool fzf)
    else
        result=$(project_tool pick $1)
    fi

    if [ -f "$result" ]; then
        nvim $result
    elif [ -d "$result" ]; then
        cd $result
        nvim .
        cd $OLDPWD
    else
        echo "Invalid result: $result"
    fi
}

cdp() {
    if [ -z "$1" ]; then
        cd $(project_tool fzf)
    else
        cd $(project_tool pick $1)
    fi
}

fix_screen() {
  xrandr --output eDP-1 --mode 1920x1080 --rate 40.02;
  sleep 5;
  xrandr --output eDP-1 --mode 1920x1080 --rate 59.97;
}

autoload -Uz nv cdp fix_screen
