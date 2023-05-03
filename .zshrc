# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Bindkeys to vi
bindkey -v

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

# fzf
export FZF_DEFAULT_OPTS='--height 30% --border'

release_file="/etc/os-release"
if grep -q -i archlinux $release_file; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
elif grep -q -i debian $release_file; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
else
  printf "Could not find FZF completions!"
fi

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Load common aliases file
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
