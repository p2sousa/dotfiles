"NerdTree
let g:NERDTreeQuitOnOpen=0 "close after file is opened
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$']

nmap <silent> <leader>ne :NERDTreeToggle<cr>

"Markdown as github style
let vim_markdown_preview_github=1

"Enable autocomplete
let g:neocomplete#enable_at_startup=2
let g:neocomplete#enable_auto_select=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#auto_completion_start_length=1
inoremap <expr><Tab>        pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-g> neocomplete#undo_completion()
inoremap <expr> <C-l> neocomplete#complete_common_string()

set nocompatible

set runtimepath+=~/work/neocomplete.vim/
set runtimepath+=~/.cache/neobundle/gocode/vim/

set fo+=aw
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 0
set tw=10 " just for testing purposes
setlocal omnifunc=gocode#Complete

filetype indent plugin on

"golang
let g:go_fmt_command="goimports"
let g:go_highlight_types=1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_operators = 1
let g:go_auto_type_info = 1

let g:go_auto_sameids = 1
let g:go_guru_tags = "mycustomtag"
let g:go_list_type = "quickfix"

"ag
let g:ag_lhandler="botright lopen"

"ctrl+p
let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|tmp'

"ale lint
let b:ale_linters = {'javascript': ['eslint']}
let b:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1
let g:jsx_ext_required = 0

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
