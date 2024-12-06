# SET QUICK ZSH EDIT
zshrc_dir=$(dirname "${(%):-%x}")
alias edit_zsh="nvim ${zshrc_dir}/.zshrc"

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
alias prj="cd $PRJ; nvim"
alias edit_nvim="cd ${XDG_CONFIG_HOME}/nvim ; nvim"
alias edit_i3="nvim ${I3_CONFIG_DIR}/config"
alias edit_tmux="nvim ${XDG_CONFIG_HOME}/tmux/.tmux.conf"
alias find_font="cat ~/Desktop/nerd_fonts_reference.txt | grep"
function fix_screen() {
  xrandr --output eDP-1 --mode 1920x1080 --rate 40.02;
  sleep 5;
  xrandr --output eDP-1 --mode 1920x1080 --rate 59.97;
}
export fix_screen
echo "Initialized .zshrc"
