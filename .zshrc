# History settings
HISTFILE=~/.zsh_history     # History filepath
HISTSIZE=5000               # Maximum events in shell history scrollback
SAVEHIST=1000               # Maximum events in history file

# Bindkeys
bindkey -e

# Report CPU usage for commands running longer than 10 seconds
REPORTTIME=10

# Aliases that add colors
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias ll="ls -laF --color=auto"
alias dmesg="dmesg --color"
alias ip="ip -color=auto"

# Aliases for specific distributions
release_file="/etc/os-release"
if [[ -n $(find /etc -maxdepth 1 -name "*-release" -print) ]]; then
  if grep -q -i archlinux $release_file; then
    alias yolo="sudo pacman -Syu --noconfirm && yay -Syua --devel --noconfirm && flatpak update -y && flatpak uninstall --unused -y"
    alias lsorphans="pacman -Qtdq"
    alias rmorphans="pacman -Qtdq | sudo pacman -Rns -"
    alias lsexplicit="pacman -Qetq"
    alias lsaur="pacman -Qmq"
    alias upvote="for i in `pacman -Qqm`; do ssh aur@aur.archlinux.org vote $i; done"
    alias updatemirror="sudo reflector --country US --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
  elif grep -q -i debian $release_file; then
    alias yolo="sudo apt update && sudo apt dist-upgrade && sudo apt autoclean && sudo apt autoremove"
  fi
else
  printf "Release file not found, could not set distro-specific aliases."
fi

# Editor
if [[ -x "$(command -v vim)" ]]; then
  export VISUAL=vim
  export EDITOR="$VISUAL"
elif [[ -x "$(command -v vi)" ]]; then
  export VISUAL=vi
  export EDITOR="$VISUAL"
else
   printf "Please set an editor, vim and/or vi are not installed"
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
