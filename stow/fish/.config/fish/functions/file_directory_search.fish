function file_directory_search

    find . -type d | fzf --preview='tree -C {} | head -n 50'
end
