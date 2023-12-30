#!/bin/bash
SESSION="$1"
# Start a new tmux session
tmux new-session -d -s $SESSION

# Rename the first window
tmux rename-window -t $SESSION:1 'Editor'

# Split the first pane of the first window into two horizontal panes
tmux split-window -v

# Split the first window into two vertical panes
tmux split-window -h

# Create a new window with the name 'Second Window'
tmux new-window -t $SESSION:2 -n 'Terminal'

# Split the first window of 'Second Window' into two horizontal panes
#tmux split-window -v

# Attach to the tmux session
tmux attach-session -t $SESSION
