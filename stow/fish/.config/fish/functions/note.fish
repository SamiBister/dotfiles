function note
    set year (date +%Y)
    set month (date +%m)
    set day (date +%d)
    set basedirectory "$HOME/notes/notes"
    set filename "$year-$month-$day-note.md"
    set subject $argv[1]
    set dir_path "$basedirectory/$year/$month"
    set file_path "$dir_path/$filename"

    if not test -e $file_path
        mkdir -p $dir_path
        echo "# $year-$month-$day" >$file_path
        #echo "# $day" > $year/$month/$filename
    end
    echo "
:
## $subject

" >>$file_path
    vsbi $file_path

end
