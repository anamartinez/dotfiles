set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-git'
Plugin 'msanders/snipmate.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Shutnik/jshint2.vim'

Plugin 'scrooloose/syntastic'

Plugin 'jgdavey/vim-blockle'

Plugin 'bling/vim-airline'



call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set background=dark
set t_Co=256
set noswapfile
colorscheme desert
set expandtab
set tabstop=2
set shiftwidth=2
set number

autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufWritePre * :%s/\s\+$//e
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim

"Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"vim-airline
set laststatus=2
