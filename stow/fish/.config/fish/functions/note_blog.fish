function note_blog
    set year (date +%Y)
    set month (date +%m)
    set day (date +%d)
    set basedirectory "$HOME/notes/blog"
    set subject $argv[2]
    set class $argv[1]
    set filename "$year-$class-$subject.md"
    set dir_path "$basedirectory/$year"
    set file_path "$dir_path/$filename"

    if not test -e $file_path
        mkdir -p $dir_path
        echo "# $subject " >$file_path
    end
    vsbi $file_path
end
