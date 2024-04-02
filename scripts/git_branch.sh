#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$CURRENT_DIR/helpers.sh"

print_git_branch() {
    is_git_dir=$(is_git_directory)
    if [ "$is_git_dir" = "true" ]; then
        dir=$(get_pane_directory)
        git_branch="$(git -C $dir branch | grep "*" | sed 's/* //')"
        echo $git_branch
    else
        echo "n/a"
    fi
}

main() {
    print_git_branch
}
main
