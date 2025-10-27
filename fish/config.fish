# Keep in config.fish so scripts know nvim alias
alias nvim="env NVIM_APPNAME=quaid_nvim nvim"
alias v="nvim"

if status is-interactive
    # Commands to run in interactive sessions can go here
    # echo "This is an interactive session"

    source ~/.config/fish/aliases.fish
    source ~/.config/fish/functions.fish
    source ~/.config/fish/quaid.fish

    set -gx EDITOR nvim
    set -gx SUDO_EDITOR $EDITOR
    set -gx MANPAGER 'nvim +Man!'

    fish_add_path $HOME/apps/
else
    # Commands to run in non-interactive sessions
    # echo "This runs in cases such as fish -c "hi" or scripts"
end
