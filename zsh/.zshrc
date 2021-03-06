# Source Antigen
if [[ ! -e ${HOME}/.bin/antigen.zsh ]]; then
    echo "Antigen is not installed. Install it into: '${HOME}/.bin/antigen.zsh'"
    exit 1
fi

source ${HOME}/.bin/antigen.zsh

# Load Antigen configurations
antigen init ~/.antigenrc

# Aliases
# --------------
[[ -f "${HOME}/.zsh_aliases" ]] && source "${HOME}/.zsh_aliases"

# Global variables setup
# --------------
[[ -f "${HOME}/.zsh_variables" ]] && source "${HOME}/.zsh_variables"

# Ctrl + p
# --------------

# Bind Ctrl + p to fuzzy zsh-fuzzy-search-and-edit
bindkey '^P' fuzzy-search-and-edit

# Change the editor invoked with Ctrl + p
zstyle ':fuzzy-search-and-edit:editor:invocation-format' editor '${EDITOR}'

# fzf
# --------------

# Key bindings
[[ -f "${HOME}/.fzf/key_bindings.zsh" ]] && source "${HOME}/.fzf/key_bindings.zsh"

# Auto-completion
[[ $- == *i* ]] && source "${HOME}/.fzf/completion.zsh" 2> /dev/null
