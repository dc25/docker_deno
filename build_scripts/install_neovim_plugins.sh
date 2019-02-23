#! /bin/bash

nvim +PlugInstall +UpdateRemotePlugins +qa
vim +PlugInstall +qa

mkdir -p .config/nvim/ftdetect

cat > .config/nvim/ftdetect/ts.vim << EOF
au BufRead,BufNewFile *.ts              set filetype=typescript   
EOF
