
"2018-11-29   9:30更新

set nocompatible
set clipboard+=unnamed
set history=100
set confirm
set viminfo+=!
set iskeyword+=_,$,@,%,#,-

syntax enable
syntax on

filetype on
filetype plugin on
filetype indent on
set completeopt=preview,longest,menu

set nobackup
setlocal noswapfile
set bufhidden=hide
set linespace=0
set wildmenu
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\%c\ %p%%%)
set showcmd
set cmdheight=2
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set report=0
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch
set matchtime=5
set incsearch
set hlsearch
set ignorecase
set nohlsearch
set scrolloff=3

language messages zh_CN.utf-8
set helplang=cn
set autochdir
set nowrap
set linebreak
"set list
set showtabline=2
set guioptions-=T
set guioptions-=m
set autoread
set autowrite

set noerrorbells
set gdefault
set magic
set smartindent
set autoindent
set ai!

set shortmess=atI
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行
autocmd InsertLeave * se nocuc  " 用浅色高亮当前行  
autocmd InsertEnter * se cuc    " 用浅色高亮当前行
set foldenable      " 允许折叠  
""set foldmethod=manual   " 手动折叠  

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set fileformat=unix
set foldcolumn=0
set foldmethod=indent 
set foldlevel=99 
set foldenable
nnoremap <space> za

au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2
\ set softtabstop=2
\ set shiftwidth=2

set guifont=Inconsolata:h17

"make 运行
:set makeprg=g++\ -Wall\ \ %

" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt
"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func! SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: Rick") 
        call append(line(".")+2, "\# mail: zhang_blue@foxmail.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: Rick") 
        call append(line(".")+2, "    > Mail: zhang_blue@foxmail.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
    autocmd BufNewFile * normal o
    autocmd BufNewFile * normal o
endfunc 

highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" Enable folding
""set foldmethod=indent
""set foldlevel=99
" Enable folding with the spacebar
""nnoremap <space> za
let g:SimpylFold_docstring_preview=1
au BufRead *.py map <buffer> <F5> :w<CR>:!python % <CR>
" For full syntax highlighting:
let python_highlight_all=1
syntax on

func! HeaderPython()  
	call setline(1,"#!/usr/bin/env python3")
	call append(1,"#---coding:utf-8---")
    call append(2,"# File Name: ".expand("%")) 
	call append(3,"# Author: Rick")
	call append(4,"# Mail: zhang_blue@foxmail.com") 
	call append(5,"# ".strftime('%Y-%m-%d %T',localtime())) 
	normal G
	normal o
	normal o
endfunc 
autocmd bufnewfile *.py call HeaderPython()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
nnoremap <C-F2> :vert diffsplit 
"新建标签  
map <M-F2> :tabnew<CR>  
"列出当前目录文件  
map <F3> :tabnew .<CR>  
"打开树状文件目录  
map <C-F3> \be  
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

set laststatus=2    " 启动显示状态行(1),总是显示状态行(2) 
"状态行显示的内容
set statusline=[%F%m%r%h%w]\ [FORMAT=%{&ff}]\ [TYPE=%y]\ [%{&encoding}]\ [Line:%l/%L,Column:%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}     
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
"显示文件名：总行数，总的字符数
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] 
"
"2018-11-29   21:45更新

set splitbelow
set splitright
""split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"设置快速编辑_vimrc文件，e编辑_vimrc
map <silent> <leader>e:call SwitchToBuf("~/.vimrc")<cr>
"保存_vimrc文件后会自动调用新的_vimrc
autocmd! bufwritepost .vimrc source ~/.vimrc

""set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
""let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
"Plugin 'eshion/vim-sync'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
"all of your plugin must be added before the following line"
call vundle#end()
filetype plugin indent on

"关闭NERDTree快捷键
map <leader>t :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=21
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

" CTags的设定  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Sort_Type = "name"    " 按照名称排序  
let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
let Tlist_Compart_Format = 1    " 压缩方式  
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
"autocmd FileType java set tags+=D:\tools\java\tags  
"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  
"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"设置tags  
set tags=tags  

"默认打开Taglist 
let Tlist_Auto_Open=1 
"""""""""""""""""""""""""""""" 
" Tag list (ctags) 
"""""""""""""""""""""""""""""""" 
let Tlist_Ctags_Cmd = '/usr/bin/ctags' 
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

""配置tagbar插件
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=15
let g:tagbar_left=1
let g:tagbar_map_openfold = "zv"
nnoremap <silent> <F2> :TagbarToggle<CR>

""配置YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter='/usr/bin/python3'
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:syntastic_cpp_compiler='g++'
let g:syntastic_cpp_compiler_options='std=c++11 -stdlib=libc++'
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
""
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <<PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
""
""""YouCompleteMe 默认tab s-tab 和自动补全冲突
"""let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
""""let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
""
let g:ycm_confirm_extra_conf=0
""
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
""
""""nnoremap <leader>lo :lopen<CR>              "open locationlist"
""""nnoremap <leader>lc :lclose<CR>             "close locationlist"
""
inoremap <leader><leader> <C-x><C-o>
""
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
""
let g:clang_user_options='|| exit 0'
""
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

""let g:ycm_key_invoke_completion='<C-space>'
let g:ycm_key_invoke_completion='<C-z>'
let g:ycm_semantic_triggers={'c,cpp,python,java,go,erlang,perl':['re!\w{2}'], 'cs,lua,javascript':['re!\w{2}']}

let g:ycm_server_log_level='info'
let g:ycm_show_dignostics_ui=0
let g:ycm_add_preview_to_completeopt=0
noremap <C-z> <NOP>


"2018-12-02   22:15更新"
"
:colorscheme evening

