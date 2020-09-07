# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Aliases
# --------------
[[ -f "${HOME}/.zsh_aliases" ]] && source "${HOME}/.zsh_aliases"

# Global variables setup
# --------------
[[ -f "${HOME}/.zsh_variables" ]] && source "${HOME}/.zsh_variables"

# fzf
# --------------

# Key bindings
[[ -f "${HOME}/.fzf/key_bindings.sh" ]] && source "${HOME}/.fzf/key_bindings.sh"

# Auto-completion
[[ $- == *i* ]] && source "${HOME}/.fzf/completion.sh" 2> /dev/null

