result=""
if [ -z "$1" ]; then
    result=$(prj fzf)
else
    result=$(prj pick $1)
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
