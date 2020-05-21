" change <Leader>
let mapleader =","

"--------------------
" Location of init.vim and plug.vim
" Windows
" C:\Users\<username>\AppData\Local\nvim\init.vim
" C:\Users\<username>\AppData\Local\nvim\autoload\plug.vim
"
" Linux
" ~/.config/nvim/init.vim
" ~/.config/nvim/autoload/plug.vim
" --------------------


" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>

" " Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <leader>rv :source $MYVIMRC<CR>

"v some basic:
filetype plugin indent on
syntax enable
set nocompatible
set backspace=indent,eol,start
set ruler
set showcmd
set incsearch
set hlsearch
set number relativenumber
set mousehide                       " Hide mouse pointer while typing.
set updatetime=250

set scrolloff=5                     " When scrolling, keep the cursor
                                    " 5 lines below the top and 5 lines
                                    " above the bottom of the screen.

set tabstop=4                       " ┐
set softtabstop=4                   " │ Set global <TAB> settings.
set shiftwidth=4                    " │
set expandtab                       " ┘




set autowrite

" Tắt các thể loại files backup, swap, khá là annoy và không cần thiết
" vì mình đã dùng git rồi
set nobackup
set nowb
set noswapfile
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*


call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'tomtom/tcomment_vim'

Plug 'ekalinin/Dockerfile.vim'  " Vim syntax file & snippets for Docker's Dockerfile

"Plug 'Valloric/YouCompleteMe'

" Enforce editor settings
"
" " https://github.com/editorconfig/editorconfig-vim
"
Plug 'editorconfig/editorconfig-vim'

call plug#end()

syntax on
"colorscheme goodwolf


" Making it even better



" vnoremap <C-c> "+y
" map <C-p> "+p


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


" NERDtree

" Keybind
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>n :NERDTreeFocus<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Auto start NERD tree if no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" nerdtree-git-plugin

let g:NERDTreeIndicatorMapCustom = {"Modified" : "✹","Staged" : "✚","Untracked" : "✭","Renamed" : "➜","Unmerged" : "═","Deleted" : "✖","Dirty" : "✗","Clean" : "✔︎","Ignored" : "☒","Unknown" : "?"}



" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


"" Undotree
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <silent> <leader>u :UndotreeFocus<CR>

set undodir=~/tmp/nvim/undo//
set backupdir=~/tmp/nvim/backup//
set directory=~/tmp/nvim/swap//



" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


" Tagbar_markdown_setup

nnoremap <F8> :TagbarToggle<CR>

"Add support for markdown files in tagbar.

if has('win32')
   let g:md_ctags_bin=fnamemodify(stdpath('config')."\\tools\\markdown2ctags.exe", ":p")
else
   let g:md_ctags_bin=fnamemodify(stdpath('config')."/tools/markdown2ctags.py", ":p")
endif

"" Markdown
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown.pandoc',
    \ 'ctagsbin' : g:md_ctags_bin,
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
         \ 's:sections',
         \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
         \ 's' : 'section',
    \ },
    \ 'sort': 0,
    \ }

"" Ansible
let g:tagbar_type_ansible = {
   \ 'ctagstype' : 'ansible',
   \ 'kinds' : [
      \ 't:tasks'
   \ ],
   \ 'sort' : 0
   \ }

"" PowerShell
let g:tagbar_type_ps1 = {
    \ 'ctagstype' : 'powershell',
    \ 'kinds'     : [
        \ 'f:function',
        \ 'i:filter',
        \ 'a:alias'
    \ ]
    \ }

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,cc] Toggle code comments.
" " https://github.com/tomtom/tcomment_vim


map <leader>cc :TComment<CR>



" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"
" GitGutter
"

let g:gitgutter_sign_added              = '+'
let g:gitgutter_sign_modified           = '>'
let g:gitgutter_sign_removed            = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed   = '<'

let g:gitgutter_override_sign_column_highlight = 1


" Set the SignColumn highlight group to change the sign column's colour.
highlight SignColumn guibg=#ff0000 ctermbg=LightGreen


highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

highlight link GitGutterChangeLine DiffText

" Jump between hunks
"
nmap <Leader>gn <Plug>(GitGutterNextHunk)  " git next
nmap <Leader>gp <Plug>(GitGutterPrevHunk)  " git previous


" Hunk-add and hunk-revert for chunk staging
"
nmap <Leader>ga <Plug>(GitGutterStageHunk)  " git add (chunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)   " git undo (chunk)





" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -











