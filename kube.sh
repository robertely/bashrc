alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias ktx='kubectx'
alias kns='kubens'

ksh(){
  TARGET=$1
  shift
  kubectl exec -it $TARGET $@ -- /bin/sh
}
