
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
# alias kall="kubectl get $(kubectl api-resources| awk '{ print $1 }'|grep -v 'NAME'|xargs|sed -e 's/ /,/g')" # Thanks I hate it.

ksh(){
  TARGET=$1
  shift
  kubectl exec -it $TARGET $@ -- /bin/sh
}
