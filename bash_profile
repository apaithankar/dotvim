#
# ~/.bash_profile
#

RED="\E[00;31m"
NORMAL="\E[0;00m"

OS=`uname -s`
source ~/.git-completion.bash

alias vi='vim'
alias mpd='make -j24 BUILD_TESTS=0 BUILD_TYPE=opt all_pydeps all_godeps python-modules-tree FORCE_BUILD_EGG=1'
alias cscope='cscope -p4'
alias kp='ssh nutanix@katyperry-c1'
alias ts='ssh nutanix@taylorswift-c1'
alias gl='git log --stat'
alias gprm='git pull --rebase origin master'
alias sbe='. ~/bin/set_build_env'
alias moi='make -j24 orion_image BUILD_TESTS=0 BUILD_TYPE=opt BUILD_ORION_IMAGE=1 DEV_IMAGE=1'
alias germ='tools/codereview/upload-gerrit patch master'
alias gera='tools/codereview/upload-gerrit patch asterix-containers-dev'
alias mrc='make realclean'
alias nut='docker run -it --rm -v ~/git-repo/nutest/nutest:/nutest dockerrepo:5000/abhijitpaithankar/nutest-centos-6.7'

export PS1='[\D{%F} \t][\u@\h:\w$(__git_ps1 " ${RED}(%s)${NORMAL}")]\n$ '
export TOP=/home/abhijitpaithankar/git-repo/main
export PYTHONUSERBASE=${TOP}/.python
export PYTHONPATH=${TOP}/.python
export DISTCC_HOSTS="--randomize distcc-0 distcc-1 distcc-2 distcc-3 distcc-4 distcc-5 distcc-6 distcc-7 distcc-8 distcc-9 distcc-a distcc-b distcc-c distcc-d"
export CCCACHE_DISABLE=1
export CSCOPE_EDITOR=vim
export GOROOT=/opt/google/go-1.6.2
export PATH=~/bin:$GOROOT/bin:$PATH
# export GOPATH=$TOP/.go
# export GOBIN=$GOPATH/bin
# export PATH=$PATH:/opt/google/go-1.6.2/bin
# export PATH=$PATH:$GOPATH/bin


source ~/bin/ssh-find-agent.sh
set_ssh_agent_socket

if [ "$OS" == "Darwin" ]; then
   alias ls='ls -G'
elif [ "$OS" == "Linux" ]; then
   alias ls='ls --color'
   export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
fi

# The next line updates PATH for the Google Cloud SDK.
source '/home/abhijit/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/home/abhijit/google-cloud-sdk/completion.bash.inc'
