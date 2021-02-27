" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " COC
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Startify
    Plug 'mhinz/vim-startify'
     " Markdown Preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
    "Lightline status bar
    Plug 'itchyny/lightline.vim'
    " Dracula theme
    Plug 'dracula/vim', { 'as': 'dracula' }
    " Go plugin 
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " Git Integration Plugin
    Plug 'tpope/vim-fugitive'
    " Ansible plugin
    Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }
call plug#end()
