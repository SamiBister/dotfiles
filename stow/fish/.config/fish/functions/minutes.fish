function minutes
    set year (date +%Y)
    set month (date +%m)
    set day (date +%d)
    set subject $argv[1]
    set basedirectory "$HOME/notes/minutes"
    set filename "$year-$month-$day-$subject.md"
    set dir_path "$basedirectory/$year/$month"
    set file_path "$dir_path/$filename"

    if not test -e $file_path
        mkdir -p $dir_path
        echo "# $year-$month-$day $subject" >$file_path
        #echo "# $day" > $year/$month/$filename
        echo "\
## Present

## Agenda

### Status

### Backlog

### Discussion

### Approved new work

## APs
        " >>$file_path
    end
    vsbi $file_path
end
