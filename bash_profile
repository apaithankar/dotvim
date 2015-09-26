#
# ~/.bash_profile
#

RED="\E[00;31m"
NORMAL="\E[0;00m"

OS=`uname -s`
source ~/.git-completion.bash

alias mvnci='mvn clean install -DskipTests'
alias gogor='cd ~/Golang/src/github.com/apaithankar/gorilla'
alias vi='vim'
alias gpom='git pull origin master'

export PS1='[\D{%F} \t][\u@\h:\w$(__git_ps1 " ${RED}(%s)${NORMAL}")]\n$ '
export GOROOT=/usr/local/go
export GOPATH=$HOME/Golang
export SCALA_HOME=/opt/scala-2.11.5
export DEPOT_TOOLS_PATH=/home/abhijit/Projects/ChromeOS/depot_tools
export IDEA_HOME=/home/abhijit/local/idea-IC-141.178.9
export JAVA_HOME=/opt/java/64/jdk1.7.0_79/
export PATH=~/bin:$GOROOT/bin:$GOPATH/bin:$SCALA_HOME/bin:$DEPOT_TOOLS_PATH:$IDEA_HOME/bin:$PATH

if [ "$OS" == "Darwin" ]; then
   alias ls='ls -G'
   export JAVA_HOME=`/usr/libexec/java_home`
elif [ "$OS" == "Linux" ]; then
   alias ls='ls --color'
fi

tunnel() {
    sshpass -p c0113ct0r ssh -lubuntu -L $1:127.0.0.1:$1 $2
}
