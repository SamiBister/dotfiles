function draft
    set year (date +%Y)
    set month (date +%m)
    set day (date +%d)
    set time_ms (date +%H%M%S%3N)
    set basedirectory "$HOME/notes/drafts"
    set filename "$year-$month-$day-$time_ms.md"
    set dir_path "$basedirectory/$year/$month"
    set file_path "$dir_path/$filename"

    if not test -e $file_path
        mkdir -p $dir_path
        echo "# $year-$month-$day $time_ts" >$file_path
        echo "\
## Context

## Content

" >>$file_path
    end
    vsbi $file_path
end
