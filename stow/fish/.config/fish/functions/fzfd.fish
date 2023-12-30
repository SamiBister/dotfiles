function fzfd
    find . -type d | fzf --preview='tree -C {} | head -n 50'
end
