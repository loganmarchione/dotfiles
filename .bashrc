# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load common aliases file
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi
# fzf
export FZF_DEFAULT_OPTS='--height 30% --border'

