call plug#begin('~/.vim/plugged')

"THEMES
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/airline-onedark.vim'

"UTILITIES
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' | Plug 'Xuyuanp/nerdtree-git-plugin' "file drawer
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim' "fuzzy file finder
Plug 'terryma/vim-multiple-cursors' "select multiple occurencies
Plug 'rking/ag.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-sensible'
Plug 'krolow/readmestart.vim'
Plug 'junegunn/vim-easy-align'

"csv
Plug 'chrisbra/csv.vim'

"markdown
Plug 'godlygeek/tabular'
Plug 'JamshedVesuna/vim-markdown-preview'

"git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'Shougo/neocomplete.vim'

"emoji
Plug 'junegunn/vim-emoji'

"comment
Plug 'tpope/vim-commentary'

"LANGUAGES

"javascript
Plug 'pangloss/vim-javascript', {'for': 'javascript'}

"jsx
Plug 'mxw/vim-jsx'

"node
Plug 'moll/vim-node'

"json
Plug 'elzr/vim-json', { 'for': 'json' }

"html/css/sass
Plug 'alvan/vim-closetag', {'for': ['html', 'hbs']}
Plug 'hail2u/vim-css3-syntax', {'for': ['html', 'css', 'scss']}
Plug 'gorodinskiy/vim-coloresque', {'for': 'html'}
Plug 'tpope/vim-haml', {'for': 'html'}
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}

"handlebars/mustache
Plug 'mustache/vim-mustache-handlebars'

"docker
Plug 'ekalinin/Dockerfile.vim'

"linter/indent/syntax
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'

"golang
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

"rust
Plug 'rust-lang/rust.vim'

"qml
Plug 'peterhoeg/vim-qml', {'for': 'qml'}

"haskel
Plug 'neovimhaskell/haskell-vim', {'for': 'hs'}

"lisp
Plug 'kovisoft/slimv', {'for': 'lisp'}

"graphql
Plug 'jparise/vim-graphql'

call plug#end()
