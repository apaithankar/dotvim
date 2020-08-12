#
# ~/.bash_profile
#

RED="\E[00;31m"
NORMAL="\E[0;00m"

OS=`uname -s`
source ~/.git-completion.bash

alias vi='vim'
alias gl='git log --stat'
alias gprm='git pull --rebase origin master'

export PS1='[\D{%F} \t][\u@\h:\w$(__git_ps1 " ${RED}(%s)${NORMAL}")]\n$ '
export CSCOPE_EDITOR=vim
export GOROOT=/usr/local/go
export LC_ALL=en_US.UTF-8

source ~/bin/ssh-find-agent.sh
set_ssh_agent_socket

if [ "$OS" == "Darwin" ]; then
   alias ls='ls -G'
   export GOPATH=/Users/apaithankar/go
   export GEM_HOME=/Users/apaithankar/.gem
elif [ "$OS" == "Linux" ]; then
   alias ls='ls --color'
   export GOPATH=/home/abhijit/go
   export GEM_HOME=/home/abhijit/.gem
   export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
fi
export PATH=~/bin:$GOROOT/bin:$GOPATH/bin:$GEM_HOME/bin:$HOME/.cargo/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/abhijitpaithankar/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/abhijitpaithankar/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/abhijitpaithankar/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/abhijitpaithankar/google-cloud-sdk/completion.bash.inc'
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f /home/abhijit/google-cloud-sdk/path.bash.inc ]; then
  source '/home/abhijit/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /home/abhijit/google-cloud-sdk/completion.bash.inc ]; then
  source '/home/abhijit/google-cloud-sdk/completion.bash.inc'
fi

if [ -f /home/abhijit/dotvim/bundle/gruvbox/gruvbox_256palette.sh ]; then
  source '/home/abhijit/dotvim/bundle/gruvbox/gruvbox_256palette.sh'
fi
