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
  PS1="$(show_dir)$(git_branch) $(prompt_char $LASTEXIT) "
}
