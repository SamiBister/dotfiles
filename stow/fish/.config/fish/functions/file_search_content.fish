function file_search_content
    set search_term $argv[1]
    set search_path $argv[2]

    if test -z "$search_term" -o -z "$search_path"
        echo "Usage: fzfrg <search_term> <search_path>"
        return 1
    end
    cd $search_path
    #rg --line-number --column --color=always $search_term $search_path | fzf --ansi --preview 'bat --color=always --line-range=:500 {1}' --preview-window=up:50%
    rg --line-number --no-heading --color=always --smart-case $search_term | fzf -d ':' -n 2.. --ansi --no-sort --preview-window 'down:33%:+{2}' --preview 'bat --style=numbers --color=always --highlight-line {2} {1}'

end
