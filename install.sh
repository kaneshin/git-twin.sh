#!/bin/sh

# File:         install.sh
# Version:      0.1.0
# Maintainer:   Shintaro Kaneko <kaneshin0120@gmail.com>
# Last Change:  08-Feb-2013.


# settings
git=`which git 2>&1`
if [[ $? == 0 ]]; then
    # clone
    if [[ -d ~/.git-twin.sh ]]; then
        # git pull
        dir=`pwd`
        cd ~/.git-twin.sh
        git pull origin master
        cd $dir
    else
        git clone https://github.com/kaneshin/git-twin.sh ~/.git-twin.sh
    fi
    # add configuration into .bashrc
    echo '[[ -s "$HOME/.git-twin.sh/twin.sh" ]] && source ~/.git-twin.sh/twin.sh && alias git-twin="_git_twin"' >> ~/.bashrc
    # .gitconfig alias.twin
    git config --global alias.twin '!sh -c "source ~/.git-twin.sh/twin.sh && _git_twin \"\$0\" \"\$1\""'
fi

