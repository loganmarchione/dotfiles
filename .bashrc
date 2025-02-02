# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Some of these options come from here
# https://github.com/mrzool/bash-sensible
########################################
# History
########################################
# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# History stored in memory
HISTSIZE=5000

# History stored on disk
HISTFILESIZE=10000

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# Ignore commands that start with spaces or duplicate commands
# Shorthand for ignorespace:ignoredups
HISTCONTROL=ignoreboth

########################################
# Tab completion (Readline bindings)
########################################
# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

# Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

########################################
# Directory navigation
########################################
# Prepend cd to directory names automatically
shopt -s autocd

# Correct spelling errors during tab-completion
shopt -s dirspell

# Correct spelling errors in arguments supplied to cd
shopt -s cdspell

########################################
# fzf
########################################
export FZF_DEFAULT_OPTS='--height 30% --border'

release_file="/etc/os-release"
if grep -q -i archlinux $release_file; then
  # fzf 0.48.0 and newer can use this
eval "$(fzf --bash)"
elif grep -q -i debian $release_file; then
  source /usr/share/doc/fzf/examples/key-bindings.bash
else
  printf "Could not find FZF completions!"
fi

########################################
# Custom prompt
########################################
#hostname=$(uname -n)
#username=$(/usr/bin/id -un)
#PS1="\n\${PWD}\n\${username}@\${hostname}\n> "
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)';
PS1='\n\w\n\u@\h ${PS1_CMD1}\n> '

########################################
# Load common aliases file
########################################
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi
