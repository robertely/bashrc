
bashrc_install(){
  local RCD="$HOME/.bashrc.d"
  local RC="$HOME/.bashrc"  
  local LINE='for f in $HOME/.bashrc.d/*.sh; do source $f; done'
  
  if [ ! -L "$RCD" ]; then
    ln -s "$RCD" "$HOME/Projects/bashrc/bashrc.d/"
    echo '- Created bashrc.d link'
  fi
  grep -qF -- "$LINE" "$RC" || echo "$LINE" >> "$RC"
}

converge(){
  mkdir -p $HOME/Projects
  if [ ! -d "$HOME/Projects/bashrc" ]; then
    if [ -f "$HOME/.ssh/id_rsa.pub" ]; then
      git clone git@github.com:robertely/bashrc.git $HOME/Projects/
    else
      git clone https://github.com/robertely/bashrc.git $HOME/Projects/
    fi
  fi
  bashrc_install
  source $HOME/.bashrc
}
