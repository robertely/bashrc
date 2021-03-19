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
