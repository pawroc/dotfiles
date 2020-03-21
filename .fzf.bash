# Setup fzf
# ---------
if [[ ! "$PATH" == */home/dpawel/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/dpawel/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/dpawel/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/dpawel/.fzf/shell/key-bindings.bash"
