#
# ~/.bash_profile
#

RED="\E[00;31m"
NORMAL="\E[0;00m"

OS=`uname -s`
source ~/.git-completion.bash

alias gogor='cd ~/Golang/src/github.com/apaithankar/gorilla'
alias vi='vim'
alias xterm_white='xterm -fa 'Monaco' -fs 11 -fg black -bg white +sb'
alias xterm_black='xterm -fa 'Monaco' -fs 11 -fg white -bg black +sb'

export PS1='[\D{%F} \t][\u@\h:\w$(__git_ps1 " ${RED}(%s)${NORMAL}")]\n$ '
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=~/bin:$GOROOT/bin:$GOPATH/bin:~/local/idea-IC-162.1121.32/bin:$PATH

if [ "$OS" == "Darwin" ]; then
   alias ls='ls -G'
   export JAVA_HOME=/usr/libexec/java_home
elif [ "$OS" == "Linux" ]; then
   alias ls='ls --color'
   export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
fi

# The next line updates PATH for the Google Cloud SDK.
source '/home/abhijit/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/home/abhijit/google-cloud-sdk/completion.bash.inc'
