_____________________________
# \*\*\*UNDER DEVELOPMENT\*\*\*
_____________________________
# Tmux Git Status

Enables displaying the current git branch name in your tmux terminal status bar, or 'n/a' if outside a git directory.

Supports `status-right` and `status-left`.

## Installation
This plugin is best installed with the [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

Add the plugin to the `.tmux.conf` file:
```shell
set -g @plugin 'bduranleau/tmux-git'
```
Install via TPM with the command `<prefix> + I`

If format strings are added to `status-right` or `status-left`, they should now be visible.

An example Catppuccin config using the [Catppuccin](https://github.com/catppuccin/tmux) tmux plugin:
```shell
show_git() {
    local index icon color text module

    index=$1
    icon="$(get_tmux_option "@catppuccin_git_icon" "")"
    color="$(get_tmux_option "@catppuccin_git_color" "$thm_red")"
    text="$(get_tmux_option "@catppuccin_git_text" "#{git_branch}")"

    module=$(build_status_module "$index" "$icon" "$color" "$text")

    echo "$module"
}
```
using the following settings in `.tmux.conf`,
```shell
set -g @catppuccin_status_modules_right "git application session user cpu"
```
Should result in the following:

![git main branch](https://github.com/bduranleau/tmux-git/assets/13445440/f5918458-2b5c-4414-8ae6-029ff5bdd913)

or, if outside a git directory:

![outside git directory](https://github.com/bduranleau/tmux-git/assets/13445440/c301301d-7810-45b1-b142-04ad2af83dec)



### License
[MIT](LICENSE.md)
