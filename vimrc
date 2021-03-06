"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"git interface
Plugin 'tpope/vim-fugitive'
"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' 

"html
"  isnowfy only compatible with python not python3
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'
"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

"auto-completion stuff
"Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/rope-vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
""code folding
Plugin 'tmhedberg/SimpylFold'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'sickill/vim-monokai'
Plugin 'vim-scripts/taglist.vim' 

call vundle#end()

filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1
"寻找全局配置文件
let g:ycm_global_ycm_extra_conf ='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"禁用syntastic来对python检查
"let g:syntastic_ignore_files=[".*\.py$"] 
"使用ctags生成的tags文件
"let g:ycm_collect_identifiers_from_tag_files = 1
"开启语义补全
"修改对C语言的补全快捷键，默认是CTRL+space，修改为ALT+;未测出效果
let g:ycm_key_invoke_completion = '<M-;>'
"设置转到定义处的快捷键为ALT+G，未测出效果
"nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR> 
"关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
"在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
"让补全行为与一般的IDE一致
set completeopt=longest,menu
"不显示开启vim时检查ycm_extra_conf文件的信息
"let g:ycm_confirm_extra_conf=0
"每次重新生成匹配项，禁止缓存匹配项
"let g:ycm_cache_omnifunc=0
"在注释中也可以补全
let g:ycm_complete_in_comments=1
"输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
"错误标识符
let g:ycm_error_symbol='>>'
"警告标识符
let g:ycm_warning_symbol='>*'
"不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
let g:ycm_use_ultisnips_completer=0



"custom keys
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
call togglebg#map("<F5>")



"syntax enable
colorscheme monokai
"set guifont=Monaco:h14


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"不显示帮助信息
let NERDTreeMinimalUI=1
"鼠标点击  
let NERDTreeMouseMode = 2
"宽度
let g:NERDTreeWinSize = 30
"忽略文件、隐藏文件
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeSortOrder=['\/$', 'Makefile', 'makefile', '*', '\~$']
nmap wm :NERDTreeToggle<cr>
"关闭当前窗口
nmap wc      <C-w>c
"分割窗口
nmap wv      <C-w>v
"打开quickfix
nmap wq :copen<cr>
"分割窗口移动快捷键
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
"关闭窗口
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"-----------------------------------------------------------------
"" plugin - taglist.vim
"-----------------------------------------------------------------
let Tlist_Show_One_File = 1 " 不同时显示多个文件的tag，只显示当前文件的 
let Tlist_Exit_OnlyWindow = 1 " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1 " 在右侧窗口中显示taglist窗口      
let Tlist_File_Fold_Auto_Close=1 " 自动折叠当前非编辑文件的方法列表 
let Tlist_Auto_Open = 0                                                 
let Tlist_Auto_Update = 1                                               
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Compact_Format = 1
" let Tlist_Display_Prototype = 0    
nnoremap <silent><F7> :TlistToggle<CR>     
"I don't like swap files
set noswapfile

"turn on numbering
set nu

"python with virtualenv support

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
