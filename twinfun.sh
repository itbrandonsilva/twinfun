function a () {
    echo -e "$1" >> "$F";
}

F=.vimrc;
a "set nowrap";
a "set tabstop=4";
a "set shiftwidth=4";
a "set expandtab";
a "set hlsearch";

if type git &> /dev/null; then
    git config --global user.name   "Brandon Silva";
    git config --global user.email  "itbrandonsilva@gmail.com";
    git config --global core.editor vim;
fi
