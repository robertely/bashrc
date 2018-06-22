# Alias block
alias ll='ls -al'
alias l='ls -a1'
alias gr='go run *.go'

# Terrible Chef things
if hash chef 2>/dev/null; then
    eval "$(chef shell-init bash)"
    export EDITOR=/usr/bin/vim
fi

# Terrible Ruby things
if hash rbenv 2>/dev/null; then
    eval "$(rbenv init -)"
fi

# Golang
export GOPATH=~/Projects/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

# LS Colors
export TERM=xterm-color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Color alias
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
ORANGE=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BOLD=$(tput bold)
UNDERLINE=$(tput sgr 0 1)
RESET=$(tput sgr0)

# Crude caffine replacement
caff(){
  if [[ $OSTYPE == darwin* ]]; then
    local DURATION=${1-21600}
    caffeinate -dim -t $DURATION &
    echo "Caffinated for $DURATION seconds"
  else
    echo "DARWIN ONLY"
  fi
}

decaff(){
  pkill -9 caffeinate
  echo "Decaffinated"
}

# Prints colored git branch
git_branch(){
  if [ -d ".git" ]; then
    # Control will enter here if $DIRECTORY exists.
    local BRANCH="$(git branch 2>/dev/null | grep '^*' | colrm 1 2)"
    if [[ ! -z "$BRANCH" ]]; then
      if [[ "$BRANCH" == "master" ]]; then
        printf "\[${WHITE}\]*\[${RED}\]$BRANCH\[${RESET}\]"
      else
        printf "\[${WHITE}\]*\[${ORANGE}\]$BRANCH\[${RESET}\]"
      fi
    fi
  fi
}

# Print the promt prefix char using last exit code
prompt_char(){
  local CHAR="⟩" # ▷ > ⟩ 〉〉
  if [ "$1" == "0" ]; then
    printf "\[${GREEN}${BOLD}\]$CHAR\[${RESET}\]"
  else
    printf "\[${RED}${BOLD}\]$CHAR\[${RESET}\]"
  fi
}

# Adds color to current Dir
show_dir(){
  printf "\[${CYAN}\]\W\[${RESET}\]"
}

# https://stackoverflow.com/questions/16715103/bash-prompt-with-last-exit-code
PROMPT_COMMAND=__prompt_command

# Finally PS1
__prompt_command() {
  local LASTEXIT="$?"
  PS1="$(show_dir)$(git_branch) $(prompt_char $LASTEXIT)"
}
