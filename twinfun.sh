function a () {
    echo -e "$1" >> "$F";
}

F=.vimrc;
a "set nowrap";
a "set tabstop=4";
a "set shiftwidth=4";
a "set expandtab";
a "set hlsearch";
