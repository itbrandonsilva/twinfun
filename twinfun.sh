#!/bin/bash

if [ "$1" = "init" ]; then
    # Ubuntu 12.04 LTS
    apt-get update;
    apt-get -y upgrade;
    apt-get -y install git vim tmux build-essential cmake cmake-gui nautilus-open-terminal iftop mesa-utils;

    # Installing smbfs allows me to execute:
    #   sudo mount -t cifs //192.168.1.1/share-name/ ~/folder-to-mount-to -o username=username-on-remote-system
    # so I can cd into a remote share from the terminal.
    # I can't get write privileges unless I install smbfs.
    # I don't quite understand why yet.
    # to unmount:
    #   sudo umount -l ~/mounted-folder
    apt-get -y install smbfs;
fi

# ensure file
function ef () {
    if [ ! -f "$F" ]
    then
        touch "$F"; 
        echo "created file \" $F \"";
    fi
}

# append
function a () {
    ef;
    if ! grep -xq "$1" "$F"
    then
        echo Appending \""$1"\" to \""$F"\";
        echo -e "$1" >> "$F";
    fi
}

echo -e ""

F=~/.vimrc;
a "set nowrap";
a "set tabstop=4";
a "set shiftwidth=4";
a "set expandtab";
a "set hlsearch";
a "set number";
# Prevents auto EOFN (End of file newline)
# a "set binary";

F=~/.tmux.conf;
a "set -g base-index 1";
a "set -g pane-base-index 1";

if type git &> /dev/null; then
    git config --global user.name   "Brandon Silva";
    git config --global user.email  "itbrandonsilva@gmail.com";
    git config --global core.editor vim;
fi

F=~/.sqliterc;
a ".headers on";
a ".mode column";

echo -e "done.";
echo -e "";
