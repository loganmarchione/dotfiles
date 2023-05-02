# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set PATH so it includes user's private bin, if it exists
if [[ -d "$HOME/bin" ]] ; then
  PATH=":$PATH:$HOME/bin"
fi

# Variables
hostname=$(uname -n)
username=$(/usr/bin/id -un)
## Colors
NORM="\e[0m"
RED_F="\e[31m"
RED_B="\e[41m"
GREEN_F="\e[32m"
GREEN_B="\e[42m"
YELLOW_F="\e[33m"
YELLOW_B="\e[43m"
BLUE_F="\e[34m"
BLUE_B="\e[44m"
MAGENTA_F="\e[35m"
MAGENTA_B="\e[45m"
CYAN_F="\e[36m"
CYAN_B="\e[46m"
GRAY_F="\e[37m"
GRAY_B="\e[47m"
WHITE_F="\e[97m"
WHITE_B="\e[107m"

# PS1 for specific shells
if [[ "$SHELL" == "/bin/bash" ]];then
  # Unicode symbols
  skull=$'\xE2\x98\xA0'
  star=$'\xe2\x98\x85'

  # Unicode boxes
  ## Corners
  top_left=$'\xe2\x94\x8c'
  top_left_arc=$'\xe2\x95\xad'
  top_right=$'\xe2\x94\x90'
  top_right_arc=$'\xe2\x95\xae'
  bottom_left=$'\xe2\x94\x94'
  bottom_left_arc=$'\xe2\x95\xb0'
  bottom_right=$'\xe2\x94\x98'
  bottom_right_arc=$'\xe2\x95\xaf'
  ## T's
  right_t=$'\xe2\x94\xa4'
  left_t=$'\xe2\x94\x9c'
  top_t=$'\xe2\x94\xac'
  bottom_t=$'\xe2\x94\xb4'
  ## Lines
  horiz=$'\xe2\x94\x80'
  vert=$'\xe2\x94\x82'
  cross=$'\xe2\x94\xbc'
  XX=$'\xe2\x95\xb3'

  # Set PS1 for bash
  PS1="\n$top_left_arc$horiz\${PWD}\n$left_t$horiz\${username}@\${hostname}\n$bottom_left_arc$horiz${RED_F} ${star}${NORM} "
else
  # Set PS1 for all other shells
  PS1="\n\${PWD}\n\${username}@\${hostname}\n${RED_F} >>${NORM} "
fi

# Load common aliases file
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

# If a display is connected, startx
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
