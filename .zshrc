# Bindkeys
bindkey -e

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Updates
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto        # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Plugins
plugins=(fzf git)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# User configuration goes here

# Load common aliases file
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi
