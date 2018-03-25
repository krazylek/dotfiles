mkdir -p ~/.vim/tmp
# Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s $(pwd)/vimrc ~/.vimrc
