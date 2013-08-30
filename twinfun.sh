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

F=~/.tmux.conf;
a "set -g base-index 1";
a "set -g pane-base-index 1";

if type git &> /dev/null; then
    git config --global user.name   "Brandon Silva";
    git config --global user.email  "itbrandonsilva@gmail.com";
    git config --global core.editor vim;
fi

echo -e "done.";
echo -e "";
