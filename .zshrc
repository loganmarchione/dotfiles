# History settings
HISTFILE=~/.zsh_history     # History filepath
HISTSIZE=5000               # Maximum events in shell history scrollback
SAVEHIST=1000               # Maximum events in history file

# Bindkeys
bindkey -e

# Report CPU usage for commands running longer than 10 seconds
REPORTTIME=10

# Load common aliases file
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# Autoload
autoload -Uz colors && colors

# Completions
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# Git stuff
# %a = current git action
# %b = current branch name
# %c = staged changes
# %r = repository
# %s = vcs system (git, svn, etc...)
# %u = unstaged changes
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats '%s %F{240}(%b)%r%f %u%c'
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_

# Prompt
# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%n@%m:%F{240}%~%f%b %# '
