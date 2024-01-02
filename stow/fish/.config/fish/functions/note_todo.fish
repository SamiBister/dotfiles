function note_todo
    set year (date +%Y)
    set month (date +%m)
    set day (date +%d)
    set basedirectory "$HOME/notes/todo"
    set filename "$year-$month-$day-todo.md"
    set dir_path "$basedirectory/$year/$month"
    set file_path "$dir_path/$filename"

    if not test -e $file_path
        mkdir -p $dir_path
        echo "# $year-$month Todo

## Open

## Done
" >$file_path
    end
    vsbi $file_path
end
