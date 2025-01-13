result=""
arg1=$1
command="nvim"

if [ -z "$arg1" ]; then
    result=$(prj fzf)
else
    result=$(prj pick $arg1)
fi

if [ ! -w "$result" ]; then
    command="sudo -E -s nvim"
fi

if [ -f "$result" ]; then
    $command $result
elif [ -d "$result" ]; then
    cd $result
    $command .
else
    echo "Invalid result: $result"
fi
