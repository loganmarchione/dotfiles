# If not running interactively, don't do anything
[[ $- != *i* ]] && return

release_file="/etc/os-release"
if grep -q -i debian $release_file; then
  source /usr/share/doc/fzf/examples/key-bindings.bash
  source /usr/share/doc/fzf/examples/completion.bash
else
  printf "Could not find FZF completions!"
fi

# Load common aliases file
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi
