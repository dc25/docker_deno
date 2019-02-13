#! /bin/bash

nvim +PlugInstall +UpdateRemotePlugins +qa
mkdir -p .config/nvim/ftdetect

cat > .config/nvim/ftdetect/ts.vim << EOF
au BufRead,BufNewFile *.ts              set filetype=typescript   
EOF
