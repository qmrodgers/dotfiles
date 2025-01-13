result=""
arg1=$1
command="nvim"

if [ -z "$arg1" ]; then
    result=$(prj fzf)
else
    result=$(prj pick $arg1)
fi

if [ -f "$result" ]; then
    wezterm cli set-tab-title ${result%/*}
    $command $result
elif [ -d "$result" ]; then
    wezterm cli set-tab-title ${result%/*}
    cd $result
    $command .
else
    echo "Invalid result: $result"
fi
