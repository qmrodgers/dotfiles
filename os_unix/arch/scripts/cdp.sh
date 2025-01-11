if [ -z "$1" ]; then
    cd $(prj fzf)
else
    cd $(prj pick $1)
fi
