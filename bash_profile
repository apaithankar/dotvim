#
# ~/.bash_profile
#

RED="\E[00;31m"
NORMAL="\E[0;00m"

OS=`uname -a | awk '{print $1}'`
source ~/.git-completion.bash

alias mvnci='mvn clean install -DskipTests'
alias gogor='cd ~/Golang/src/github.com/apaithankar/gorilla'

export PS1='[\D{%F} \t][\u@\h:\w$(__git_ps1 " ${RED}(%s)${NORMAL}")]\n$ '
export GOROOT=/usr/local/go
export GOPATH=$HOME/Golang
export PATH=~/bin:$GOPATH/bin:$PATH

if [ "$OS" == "Darwin" ]; then
   alias ls='ls -G'
   export JAVA_HOME=`/usr/libexec/java_home`
elif [ "$OS" == "Linux" ]; then
   alias ls='ls --color'
fi
