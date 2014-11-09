Installation:

    git clone git://github.com/nelstrom/dotvim.git ~/.vim

Create symlinks:

    FILES='vimrc git-completion.bash bashrc bash_profile'
    for i in $FILES; do ln -s ~/.vim/${i} ~/.${i}

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update
