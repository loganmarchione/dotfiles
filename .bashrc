# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set PATH so it includes user's private bin, if it exists
if [[ -d "$HOME/bin" ]] ; then
  PATH=":$PATH:$HOME/bin"
fi

# Load common aliases file
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi
