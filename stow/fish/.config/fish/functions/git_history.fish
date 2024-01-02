function git_history
    set -l commit (git log --pretty=format:"%C(auto)%h %s (%cr) [%an]" --abbrev-commit | fzf --preview 'git show --color=always {1}' | cut -d ' ' -f1)
    if test -n "$commit"
        echo "Selected commit: $commit"
        git show $commit
    end
end
