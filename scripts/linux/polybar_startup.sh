#!/bin/zsh

cat <<EOF
POLYBAR STARTUP
----------------
Attempting to source zshrc in \$HOME ($HOME/.zshrc)

EOF
source $HOME/.zshrc
# export XDG_CONFIG_HOME=$HOME

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
echo $(date) > /tmp/polybar.log
polybar top 2>&1 | tee -a /tmp/polybar.log & disown
polybar bottom 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
