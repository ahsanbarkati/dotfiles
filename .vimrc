"Enable Vundle for plugin management.
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/molokai'
Plugin 'Valloric/YouCompleteMe'
" IMPORTANT NOTE: nsf/gocode is what does the autocompletion.
Plugin 'nsf/gocode', {'rtp': 'vim/'}

" For Git
Plugin 'tpope/vim-fugitive'

" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

" for file name and git details
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on
"Ok. Done.

let g:molokai_original=1
colorscheme molokai

set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:go_fmt_command = "goimports"
set hlsearch
set tabstop=2
set shiftwidth=2
set autoindent
set ignorecase
set smartcase
set number
set ruler
syntax on
set backspace=indent,eol,start

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-h>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-m>"
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']


let mapleader = " "

map <C-l> :NERDTreeToggle<CR>

" For fzf
nnoremap <silent> <C-f> :Files<CR>


noremap <leader>d :GoDecls<CR>
noremap <leader>r :GoReferrers<CR>
noremap <leader>t :GoTestFunc<CR>
map <leader>[ :GoDefPop<CR>
noremap <leader>] :GoDef<CR>
noremap <leader>f :Rg<CR>
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



"if exists ("g:did_load_filetypes")
" filetype off
" filetype plugin indent off
"endif
"set runtimepath+=/usr/local/go/misc/vim
"filetype plugin indent on

"autocmd FileType go autocmd BufWritePre <buffer> Fmt
"highlight Pmenu ctermfg=White ctermbg=Black
"highlight PmenuSel ctermfg=Blue

" let $FZF_DEFAULT_COMMAND="rg --files"
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" Open file at a position where it was last left.
au BufWinLeave *.go mkview
au BufWinEnter *.go silent loadview

autocmd BufNewFile *.cpp :0r ~/.vim/cpp 
autocmd BufNewFile *.cpp :w! 
map <F7> :!g++ -std=c++11 -DDEBUG % && ./a.out <CR>
map <F8> :!g++ -std=c++11  % && ./a.out <CR>

