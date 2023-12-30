function nvims

    # Path to your Neovim configurations directory
    set config_dir ~/.config

    # Use fzf to select a Neovim configuration directory
    set selected_config (find $config_dir -maxdepth 1 -type d -name 'nvim-*' | fzf --height=10 --reverse)

    # Check if a configuration was selected
    if test -n "$selected_config"
        # Extract the configuration name from the path
        set config_name (basename $selected_config)

        # Set NVIM_APPNAME environment variable to the selected config name
        #set -x NVIM_APPNAME $config_name

        NVIM_APPNAME=$config_name nvim $argv
        # Start Neovim with the selected configuration
        #nvim $argv
    else
        echo "No configuration selected."
    end
    # Assumes all configs exist in directories named ~/.config/nvim-*
    #local config=$(fd --max-depth 1 --glob 'nvim-*' ~/.config | fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0)

    # If I exit fzf without selecting a config, don't open Neovim
    #[[ -z $config ]] && echo "No config selected" && return

    # Open Neovim with the selected config

    # NVIM_APPNAME=$(basename $config) nvim
    #echo $config
end
