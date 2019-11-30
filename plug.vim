call plug#begin(expand('$VIMHOME/plugs'))

" web development
Plug 'Quramy/tsuquyomi', { 'do': 'npm -g install typescript' }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify', { 'do': 'git submodule update --init --recursive \| npm install . -d' }
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'groenewege/vim-less'
Plug 'jimmyhchan/dustjs.vim', { 'do': 'rm -rfv snippets' }
Plug 'mustache/vim-mustache-handlebars'
Plug 'briancollins/vim-jst'
Plug 'chr4/nginx.vim'
Plug 'gabesoft/vim-templatehtml'

" colorscheme
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'

" cursor motion
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'

" file system
Plug 'justinmk/vim-dirvish'
Plug 'scrooloose/nerdtree'

" snippets
Plug 'SirVer/ultisnips'

" multiple cursors
Plug 'terryma/vim-multiple-cursors'

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
Plug 'zxqfl/tabnine-vim'

" brace matching
Plug 'tmhedberg/matchit'
Plug 'Valloric/MatchTagAlways'

" git
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/committia.vim'

" ruby/rails
Plug 'tpope/vim-rails'
Plug 'nelstrom/vim-textobj-rubyblock'

" text objects
Plug 'glts/vim-textobj-comment'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'kana/vim-niceblock'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-surround'

" terminal
Plug 'dag/vim-fish'
Plug 'ericpruitt/tmux.vim'

Plug 'AndrewRadev/bufferize.vim'
Plug 'derekwyatt/vim-scala'
Plug 'duff/vim-scratch'
Plug 'gabesoft/splitjoin.vim'
Plug 'gabesoft/vim-haml'
Plug 'gabesoft/vim-java'
Plug 'gabesoft/vim-twm'
Plug 'gabesoft/vim-unimpaired'
Plug 'gerw/vim-HiLinkTrace'
Plug 'godlygeek/tabular'
Plug 'haya14busa/vim-operator-flashy'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-startify'
Plug 'plasticboy/vim-markdown'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'triglav/vim-visual-increment'
Plug 'Yggdroot/indentLine'

call plug#end()
