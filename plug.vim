call plug#begin(expand('$VIMHOME/plugs'))

" TODO Ensure python3 is installed and works with vim before
"      installing plugins. Also, node-js should be installed.

" web development
Plug 'Quramy/tsuquyomi', { 'do': 'npm -g install typescript' }
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'groenewege/vim-less'
Plug 'jimmyhchan/dustjs.vim', { 'do': 'rm -rfv snippets' }
Plug 'mustache/vim-mustache-handlebars'
Plug 'briancollins/vim-jst'
Plug 'chr4/nginx.vim'
Plug 'gabesoft/vim-templatehtml'
Plug 'hhvm/vim-hack'

" colorscheme
" see more at https://colorswat.ch/vim/
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'mhartington/oceanic-next'

" cursor motion
Plug 'easymotion/vim-easymotion'

" file system
Plug 'justinmk/vim-dirvish'
Plug 'scrooloose/nerdtree'

" snippets
Plug 'SirVer/ultisnips'

" search
Plug 'gabesoft/vim-ags'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-over'

" autocomplete
Plug 'tabnine/YouCompleteMe', { 'do': './install.py --all' }
Plug 'codota/tabnine-vim'

" brace matching and autoclose
Plug 'tmhedberg/matchit'
Plug 'Valloric/MatchTagAlways'

" git
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" ruby/rails
Plug 'tpope/vim-rails'
Plug 'nelstrom/vim-textobj-rubyblock' "ar, ir
Plug 'gabesoft/vim-haml'

" rust
Plug 'rust-lang/rust.vim'

" scala
Plug 'derekwyatt/vim-scala'

" java
Plug 'gabesoft/vim-java'

"groovy
Plug 'martinda/Jenkinsfile-vim-syntax'

" text objects
Plug 'glts/vim-textobj-comment' "ac, ic
Plug 'Julian/vim-textobj-variable-segment' "av, iv
Plug 'kana/vim-niceblock' "vI, vA
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-entire' "ae, ie
Plug 'kana/vim-textobj-function' "af, if
Plug 'kana/vim-textobj-indent' "ai, ii
Plug 'kana/vim-textobj-line' "al, il
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-surround'
Plug 'haya14busa/vim-operator-flashy'
Plug 'haya14busa/vim-textobj-function-syntax'

" configuration
Plug 'editorconfig/editorconfig-vim'

" terminal
Plug 'dag/vim-fish'
Plug 'ericpruitt/tmux.vim'
Plug 'gabesoft/vim-pager'
Plug 'dbeniamine/cheat.sh-vim'

Plug 'AndrewRadev/bufferize.vim'
Plug 'duff/vim-scratch'
Plug 'gabesoft/vim-twm'
Plug 'gabesoft/vim-unimpaired'
Plug 'gerw/vim-HiLinkTrace'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'plasticboy/vim-markdown'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'triglav/vim-visual-increment'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'

" no longer used or replaced
" Plug 'kshenoy/vim-signature'
" Plug 'maksimr/vim-jsbeautify', { 'do': 'git submodule update --init --recursive \| npm install . -d' }
" Plug 'prettier/vim-prettier', { 'do': 'npm install' }
" Plug 'gabesoft/splitjoin.vim'
" Plug 'cohama/lexima.vim'
" Plug 'terryma/vim-multiple-cursors'


" no longer needed as it has been merged into the vim default configuration
" Plug 'peitalin/vim-jsx-typescript'

" was used because vim-jsx-typescript had some bugs but those seem to be fixed
" Plug 'HerringtonDarkholme/yats.vim'

call plug#end()
