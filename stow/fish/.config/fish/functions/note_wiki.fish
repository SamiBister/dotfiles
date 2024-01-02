function note_wiki
    set basedirectory "$HOME/notes/wiki"
    set subject $argv[2]
    set class $argv[1]
    set filename "$class-$subject.md"
    set dir_path "$basedirectory/$class"
    set file_path "$dir_path/$filename"

    if not test -e $file_path
        mkdir -p $dir_path
        echo "# $class $subject" >$file_path
    end
    vsbi $file_path
end
