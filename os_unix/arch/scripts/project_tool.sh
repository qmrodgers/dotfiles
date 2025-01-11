declare -A projects

if [ -z "$1" ]; then
    echo "No tool specified. Exiting." >&2
    exit 1
elif [ ! -f "$HOME/.projects" ]; then
    touch "$HOME/.projects"
fi

check_key_exists() {
    local key="$1"
    if [[ -v projects["$key"] ]]; then
        return 0
    else
        return 1
    fi
}

while IFS=';' read -r shorthand longhand path; do
    if check_key_exists "$shorthand" || check_key_exists "$longhand"; then
        echo "Duplicate project shorthand '$shorthand' or longhand '$longhand' found in $HOME/.projects. Manual intervention may be required. Exiting." >&2
        exit 1
    fi
    projects["$shorthand"]="$path"
    projects["$longhand"]="$path"
done < "$HOME/.projects"

if [ $1 = "fzf" ]; then
    fzf_list=()
    while IFS=';' read -r shorthand longhand path; do
        fzf_list+=("$shorthand   $longhand   $path")
    done < "$HOME/.projects"
    selected=$(printf "%s\n" "${fzf_list[@]}" | fzf --header="Select a project" --bind="enter:become(echo {3})" | sed 's/^"//;s/"$//')
    echo $selected
    exit 0

elif [ $1 = "pick" ]; then
    if [ -n "$2" ] && check_key_exists $2; then
        echo "${projects[$2]}"
    else
        echo "Project '$2' not found in $HOME/.projects. Exiting." >&2
        exit 1
    fi
    exit 0

elif [ $1 = "add" ]; then
    shorthand="$2"
    longhand="$3"
    path="$4"
    if [ -z "$shorthand" ] || [ -z "$longhand" ] || [ -z "$path" ]; then
        # Custom logic to request missing arguments
        #
        exit 1
    else
        if ( [ ! -d "$path" ] && [ ! -f "$path" ] ) || [ -z "$shorthand" ] || [ -z "$longhand" ]; then
            echo "Invalid path '$path' or shorthand '$shorthand' or longhand '$longhand'. Exiting." >&2
            exit 1
        fi
        path=$(realpath "$path")
        echo "$shorthand;$longhand;$path" >> "$HOME/.projects"
        echo "Project added successfully -> $(tail -n 1 $HOME/.projects)"
    fi
    exit 0
fi


