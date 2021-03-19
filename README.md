### Nothing to see here

```bash
brew update && brew install bash && sudo chsh -s /usr/local/bin/bash $(whoami)
brew install curl wget vim tree make
brew install awscli aws-iam-authenticator aws-okta kubectl kubectx minikube
```

Add to .profile or .bashrc or whatever
```bash
PATH=$PATH:~/bashrc.d/bin
for f in ~/bashrc.d/*.sh; do source $f; done
```