#!/bin/sh
CONFIG_HOME=$HOME/.mac-zsh-config

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e $CONFIG_HOME ] && die "$CONFIG_HOME already exists."

git clone git@github.com:xfalcons/bash-git-prompt.git .bash-git-prompt
git clone git@github.com:xfalcons/mac-zsh-config.git "$CONFIG_HOME"

cd ~
[ ! -d "bin" ] && mkdir -p bin
[ ! -d "mac-zsh-config.bak" ] && mkdir -p mac-zsh-config.bak

target_files=".bash_profile .bashrc .zshrc .tmux.conf .gitconfig .gitexcludes .gitignore_global bin/git_differ_wrapper"
for f in $target_files
do
    if [ -e $f ]
    then
        mv $f mac-config.bak/
        echo "Move $f to mac-zsh-config.bak/"
    fi
done

ln -s .mac-zsh-config/bash_profile .bash_profile
ln -s .mac-zsh-config/bashrc .bashrc
ln -s .mac-zsh-config/zshrc .zshrc
ln -s .mac-zsh-config/tmux.conf .tmux.conf
ln -s .mac-zsh-config/gitconfig .gitconfig
ln -s .mac-zsh-config/gitexcludes .gitexcludes
ln -s .mac-zsh-config/gitignore_global .gitignore_global
ln -s .mac-zsh-config/bin/git_diff_wrapper bin/git_diff_wrapper

# wget -O - https://raw.github.com/xfalcons/vimrc/master/auto-install.sh | sh

echo "$HOME configuration file has been installed."
