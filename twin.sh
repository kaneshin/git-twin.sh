#!/bin/sh

# File:         twin.sh
# Version:      0.1.0
# Maintainer:   Shintaro Kaneko <kaneshin0120@gmail.com>
# Last Change:  08-Feb-2013.

function git_twin()
{
    # make sure $2 is directory
    if [[ $2 == '' ]]; then
        return
    fi
    # git clone <repository> <directory>
    git clone $1 $2
    if [[ -d $2 ]]; then
        cd $2
        echo ""
        git remote -v
        git remote rm origin
        echo "$ git remote rm origin"
        echo "Set remote origin again like below."
        echo "$ git remote add origin <repository>'"
        echo "Command 'git remote -v' or 'git remote show' if you confirm remote settings."
        echo "Set branch.master.remote and branch.master.merge if you want to pull/push from a specific branch."
        echo "$ git config branch.master.remote origin"
        echo "$ git config branch.master.merge refs/heads/master"
    else
        echo 'fatal: destination path <'$2'> is not directory. Please try it again.'
    fi
}

function _git_twin()
{
    git=`which git 2>&1`
    if [[ $? == 0 ]]; then
        if [[ $# = 2 ]]; then
            git_twin $1 $2
        else
            echo 'usage: git twin <repository> <directory>'
        fi
    else
        echo 'git: command not found'
    fi
}
