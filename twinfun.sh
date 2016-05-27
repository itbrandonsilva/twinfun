#!/bin/bash

# ensure file exists
function ef () {
    if [ ! -f "$F" ]
    then
        touch "$F";
        echo "created file \" $F \"";
    fi
}

# append line to file if the line doesn't exist
function a () {
    ef;
    if ! grep -xq "$1" "$F"
    then
        echo Appending \""$1"\" to \""$F"\";
        echo -e "$1" >> "$F";
    fi
}

if [ "$1" = "init" ]; then
    # Ubuntu 14

    # Latest stable git
    # add-apt-repository http://ppa.launchpad.net/git-core/ppa/ubuntu;

    # Atom ppa
    # add-apt-repository ppa:webupd8team/atom

    # Latest stable google-chrome
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -;
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

    apt-get update;
    apt-get -y --force-yes upgrade;
    apt-get -y --force-yes install git vim tmux build-essential iftop google-chrome-stable meld; # atom

    # Prevents apt-get update warnings
    sed -i 's/\(deb\)/# \1/' /etc/apt/sources.list.d/google-chrome.list;
    chattr +i /etc/apt/sources.list.d/google-chrome.list;

    F=~/.bashrc;
    a "alias chrome=google-chrome-stable";
fi

echo -e ""

F=~/.vimrc;
a "set nowrap";
a "set tabstop=4";
a "set shiftwidth=4";
a "set expandtab";
a "set hlsearch";
a "set number";
a "au BufRead,BufNewFile *.ts set filetype=javascript"
# Prevents auto EOFN (End of file newline)
# ...or does it?
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

echo -e ""

if [ "$1" = "init" ]; then
    echo -e "Changes were potentially made to your .bashrc, be sure to source it or start a new terminal.";
fi
echo -e "done.";
echo -e "";
