function git_history_diff
    set -l commit (git log --pretty=oneline --abbrev-commit | fzf --preview 'git show --color=always {1}' | cut -d ' ' -f1)
    if test -n "$commit"
        echo "Selected commit: $commit"
        git show $commit
    end
end
