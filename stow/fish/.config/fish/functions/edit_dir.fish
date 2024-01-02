function edit_dir
    set edit_path $argv[2]
    set session_name $argv[1]

    if not test -e $edit_path
        mkdir -p $edit_path§
    end
    cd $edit_path

    if test -z "$session_name"
        echo "Please provide a session name."
        return 1
    end

    if not tmux has-session -t $session_name 2>/dev/null
        echo "Session '$session_name' does not exist, creating it..."
        tmux new-session -d -s $session_name

        # Create a new window with the name 'Second Window'
        tmux rename-window -t $session_name:1 Terminal
        tmux split-window -h
        # Split the first window into two vertical panes
        tmux new-window -t $session_name:2 -n Editor

        tmux split-window -h -l 20
        # Split the first pane of the first window into two horizontal panes
        tmux split-window -v

    else
        echo "Session '$session_name' already exists."

    end
    tmux attach-session -t $session_name
end
