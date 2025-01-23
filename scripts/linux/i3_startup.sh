#!/bin/zsh

cat <<EOF
I3 POST STARTUP SCRIPT
----------------
Attempting to source zshrc in \$HOME ($HOME/.zshrc)
EOF
source $HOME/.zshrc

feh --bg-scale $BG_IMAGE
echo "I3 launched..."
