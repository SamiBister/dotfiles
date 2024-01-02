
function git_status
    set -l files (git status -s | fzf --preview 'bat --style=changes --color=always (echo {} | cut -c4-)')
    if test -n "$files"
        set -l file (echo $files | cut -c4-)
        echo "Selected file: $file"
    end
end
