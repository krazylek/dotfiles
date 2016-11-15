mkdir -p vim/autoload vim/bundle ~/.vim-tmp
curl -LSso vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
sh init-vim-plugins.sh
sh init-vim-colors.sh
sh link.sh
