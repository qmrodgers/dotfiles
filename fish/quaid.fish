function cdp
    if test (count $argv) -eq 0
        cd (prj fzf)
    else
        cd (prj pick $argv[1])
    end
end

set -gx ZK_NOTEBOOK_DIR ~/zettelkasten
