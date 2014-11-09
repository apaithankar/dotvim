#
# ~/.bash_profile
#

RED="\E[00;31m"
NORMAL="\E[0;00m"

source ~/.git-completion.bash

alias mvnci='mvn clean install -DskipTests'
alias ls='ls -G'
export PS1='[\D{%F} \t][\u@\h:\w$(__git_ps1 " ${RED}(%s)${NORMAL}")]\n$ '
export JAVA_HOME=`/usr/libexec/java_home`
export PATH=/usr/local/bin:$PATH
