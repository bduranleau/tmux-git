#!/usr/bin/env bash

export LANG=C
export LC_ALL=C

get_tmux_option() {
    local option
    local default_value
    local option_value

    option="$1"
    default_value="$2"
    option_value="$(tmux show-option -qv "$option")"

    if [ -z "$option_value" ]; then
        option_value="$(tmux show-option -gqv "$option")"
    fi

    if [ -z "$option_value" ]; then
        echo "$default_value"
    else
        echo "$option_value"
    fi
}

get_pane_directory() {
    echo "$(tmux display-message -p -F "#{pane_current_path}" -t0)"
}

is_git_directory() {
    local dir
    dir=$(get_pane_directory)
    local is_git_dir="$(git -C $dir rev-parse --is-inside-work-tree)"
    if [ "$is_git_dir" = "true" ]; then
        is_git_dir=true
    else
        is_git_dir=false
    fi
    echo $is_git_dir
}
