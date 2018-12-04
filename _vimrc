
"2018-8-23  16:00 ����

" ���ö����Ի���,���������������

if has("multi_byte") 
    " UTF-8 ���� 
    set encoding=utf-8 
    set termencoding=utf-8 
    set formatoptions+=mM 
    set fencs=utf-8,gbk,gb18030,gb2312,unicode,cp936 
    if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)' 
        set ambiwidth=double 
    endif 
    if has("win32") 
        source $VIMRUNTIME/delmenu.vim 
        source $VIMRUNTIME/menu.vim 
        language messages zh_CN.utf-8 
    endif 
else 
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte" 
endif

set nu!
colorscheme desert 
syntax enable 
syntax on




"2018-8-23  17:00 ����
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin
 
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
 
 
"�����ļ��Ĵ�����ʽ utf8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936,gb2312,gb18030,unicode
 
"vim�Ĳ˵�������
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
 
"vim��ʾ��Ϣ����Ľ��
language messages zh_CN.utf-8
 
filetype on
filetype plugin indent on
"colorscheme evening	"��ɫ����
colorscheme desert
set helplang=cn		"�������İ���
set history=500		"������ʷ��¼
"set guifont=Monaco:h18	"��������ΪMonaco����С10
set tabstop=4		"����tab������
set expandtab
set backspace=2 	"�����˸������
"set nu! 		"������ʾ�к�
set wrap 		"�����Զ�����
"set nowrap 		"���ò��Զ�����
set linebreak 		"���ʻ��У����Զ����д���ʹ��
"set list 		"��ʾ�Ʊ���
set autochdir 		"�Զ����õ�ǰĿ¼Ϊ���ڱ༭��Ŀ¼
set hidden 		"�Զ�����û�б���Ļ��������л�bufferʱ���������浱ǰbuffer����ʾ
set scrolloff=5 	"�ڹ��ӽ��׶˻򶥶�ʱ���Զ��¹����Ϲ�
"Toggle Menu and Toolbar 	"���ز˵����͹�����
"set guioptions-=m
"set guioptions-=T
set showtabline=2 	"����������ʾ��ǩ��
set autoread 		"���õ��ļ����ⲿ���޸ģ��Զ����¸��ļ�
set mouse=a 		"�������κ�ģʽ����궼����
set nobackup 		"���ò����ɱ����ļ�
"set go=				"��Ҫͼ�ΰ�ť
set guioptions-=T           " ���ع�����
"set guioptions-=m           " ���ز˵���
 
"===========================
"����/�滻��ص�����
"===========================
set hlsearch "������ʾ���ҽ��
set incsearch "��������
 
"===========================
"״̬��������
"===========================
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "��ʾ�ļ��������������ܵ��ַ���
set ruler "�ڱ༭�����У������½���ʾ���λ�õ�״̬��
 
"===========================
"��������
"===========================
syntax enable "���﷨����
syntax on "���﷨����
set showmatch "����ƥ��ģʽ���൱������ƥ��
set smartindent "���ܶ���
"set shiftwidth=4 "����ʱ������ʹ��4���ո�
set autoindent "�����Զ�����
set ai! "�����Զ�����
"set cursorcolumn "���ù����
set cursorline	"���ù����
set guicursor+=a:blinkon0 "���ù�겻��˸
set fdm=indent "
 
 
"�������
set rtp+=$VIM\vimfiles\bundle\Vundle.vim\
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'kien/ctrlp.vim'
"Plugin 'eshion/vim-sync'
"call vundle#end()
 
" �ر�NERDTree��ݼ�
map <leader>t :NERDTreeToggle<CR>
" ��ʾ�к�
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" �Ƿ���ʾ�����ļ�
let NERDTreeShowHidden=1
" ���ÿ���
let NERDTreeWinSize=21
" ���ն�����vimʱ������NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" ����һ���ļ�����ʾ
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" ��ʾ��ǩ�б�
let NERDTreeShowBookmarks=1


"2018-8-23  17:30����
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ��ʾ���  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set shortmess=atI   " ������ʱ����ʾ�Ǹ�Ԯ���ڸɴ��ͯ����ʾ  

"winpos 5 5          " �趨����λ��  

"set lines=40 columns=155    " �趨���ڴ�С  

"set nu              " ��ʾ�к�  

set go=             " ��Ҫͼ�ΰ�ť  

""color asmanian2     " ���ñ�������  

set guifont=Courier_New:h13:cANSI   " �������� Courier_New 

syntax on           " �﷨����  

autocmd InsertLeave * se nocul  " ��ǳɫ������ǰ��  

autocmd InsertEnter * se cul    " ��ǳɫ������ǰ��

autocmd InsertLeave * se nocuc  " ��ǳɫ������ǰ��  

autocmd InsertEnter * se cuc    " ��ǳɫ������ǰ��

"set ruler           " ��ʾ���  

set showcmd         " �����������ʾ�������������Щ  

"set cmdheight=1     " �����У���״̬���£��ĸ߶ȣ�����Ϊ1  

"set whichwrap+=<,>,h,l   " ����backspace�͹�����Խ�б߽�(������)  

"set scrolloff=3     " ����ƶ���buffer�Ķ����͵ײ�ʱ����3�о���  

set novisualbell    " ��Ҫ��˸(������)  

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "״̬����ʾ������  

set laststatus=1    " ������ʾ״̬��(1),������ʾ״̬��(2)  

set foldenable      " �����۵�  

set foldmethod=manual   " �ֶ��۵�  

"set background=dark "����ʹ�ú�ɫ 

set nocompatible  "ȥ��������й�viһ����ģʽ��������ǰ�汾��һЩbug�;���  

" ��ʾ���İ���

if version >= 603

    set helplang=cn

    set encoding=utf-8

endif

" ������ɫ����

"colorscheme murphy

"���� 

"if (has("gui_running")) 

"   set guifont=Bitstream\ Vera\ Sans\ Mono\ 13 

"endif 


 
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,unicode

set termencoding=utf-8

set encoding=utf-8

set fileencodings=ucs-bom,utf-8,cp936,gb2312,gb18030,unicode

set fileencoding=utf-8



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""���ļ�����""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"�½�.c,.h,.sh,.java�ļ����Զ������ļ�ͷ 

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 

""���庯��SetTitle���Զ������ļ�ͷ 

func SetTitle() 

    "����ļ�����Ϊ.sh�ļ� 

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

    "�½��ļ����Զ���λ���ļ�ĩβ

    autocmd BufNewFile * normal G

endfunc 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"��������

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



nmap <leader>w :w!<cr>

nmap <leader>f :find<cr>



" ӳ��ȫѡ+���� ctrl+a

map <C-A> ggVGY

map! <C-A> <Esc>ggVGY

map <F12> gg=G

" ѡ��״̬�� Ctrl+c ����

vmap <C-c> "+y

"ȥ����  

nnoremap <F2> :g/^\s*$/d<CR> 

"�Ƚ��ļ�  

nnoremap <C-F2> :vert diffsplit 

"�½���ǩ  

map <M-F2> :tabnew<CR>  

"�г���ǰĿ¼�ļ�  

map <F3> :tabnew .<CR>  

"����״�ļ�Ŀ¼  

map <C-F3> \be  

"C��C++ ��F5��������

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

"C,C++�ĵ���

map <F8> :call Rungdb()<CR>

func! Rungdb()

    exec "w"

    exec "!g++ % -g -o %<"

    exec "!gdb ./%<"

endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""ʵ������

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ���õ��ļ����Ķ�ʱ�Զ�����

set autoread

" quickfixģʽ

autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

"���벹ȫ 

set completeopt=preview,menu 

"�������  

filetype plugin on

"����������  

set clipboard+=unnamed 

"�Ӳ�����  

set nobackup

"make ����

:set makeprg=g++\ -Wall\ \ %

"�Զ�����

set autowrite

set ruler                   " ��״̬�����

set cursorline              " ͻ����ʾ��ǰ��

set magic                   " ����ħ��

set guioptions-=T           " ���ع�����

set guioptions-=m           " ���ز˵���

"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\

" ������״̬����ʾ����Ϣ

set foldcolumn=0

set foldmethod=indent 

set foldlevel=3 

set foldenable              " ��ʼ�۵�

" ��Ҫʹ��vi�ļ���ģʽ������vim�Լ���

set nocompatible

" �﷨����

set syntax=on

" ȥ������������ʾ����

set noeb

" �ڴ���δ�����ֻ���ļ���ʱ�򣬵���ȷ��

set confirm

" �Զ�����

set autoindent

set cindent

" Tab���Ŀ���

set tabstop=4

" ͳһ����Ϊ4

set softtabstop=4

set shiftwidth=4

" ��Ҫ�ÿո�����Ʊ���

set noexpandtab

" ���кͶο�ʼ��ʹ���Ʊ���

set smarttab

" ��ʾ�к�

set number

" ��ʷ��¼��

set history=1000

"��ֹ������ʱ�ļ�

set nobackup

set noswapfile

"�������Դ�Сд

set ignorecase

"�������ַ�����

set hlsearch

set incsearch

"�����滻

set gdefault

"��������

set enc=utf-8

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,unicode

"��������

set langmenu=zh_CN.UTF-8

set helplang=cn

" �ҵ�״̬����ʾ�����ݣ������ļ����ͺͽ��룩

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

" ������ʾ״̬��

set laststatus=2

" �����У���״̬���£��ĸ߶ȣ�Ĭ��Ϊ1��������2

set cmdheight=2

" ����ļ�����

filetype on

" �����ļ����Ͳ��

filetype plugin on

" Ϊ�ض��ļ�����������������ļ�

filetype indent on

" ����ȫ�ֱ���

set viminfo+=!

" �������·��ŵĵ��ʲ�Ҫ�����зָ�

set iskeyword+=_,$,@,%,#,-

" �ַ���������������Ŀ

set linespace=0

" ��ǿģʽ�е��������Զ���ɲ���

set wildmenu

" ʹ�ظ����backspace����������indent, eol, start��

set backspace=2

" ����backspace�͹�����Խ�б߽�

set whichwrap+=<,>,h,l

" ������buffer���κεط�ʹ����꣨����office���ڹ�����˫����궨λ��

set mouse=a

set selection=exclusive

set selectmode=mouse,key

" ͨ��ʹ��: commands������������ļ�����һ�б��ı��

set report=0

" �ڱ��ָ�Ĵ��ڼ���ʾ�հף������Ķ�

set fillchars=vert:\ ,stl:\ ,stlnc:\

" ������ʾƥ�������

set showmatch

" ƥ�����Ÿ�����ʱ�䣨��λ��ʮ��֮һ�룩

set matchtime=1

" ����ƶ���buffer�Ķ����͵ײ�ʱ����3�о���

set scrolloff=3

" ΪC�����ṩ�Զ�����

set smartindent

" ������ʾ��ͨtxt�ļ�����Ҫtxt.vim�ű���

au BufRead,BufNewFile *  setfiletype txt

"�Զ���ȫ

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

filetype plugin indent on 

"���ļ����ͼ��, �������ſ��������ܲ�ȫ

set completeopt=longest,menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CTags���趨  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let Tlist_Sort_Type = "name"    " ������������  

let Tlist_Use_Right_Window = 1  " ���Ҳ���ʾ����  

let Tlist_Compart_Format = 1    " ѹ����ʽ  

let Tlist_Exist_OnlyWindow = 1  " ���ֻ��һ��buffer��kill����Ҳkill��buffer  

let Tlist_File_Fold_Auto_Close = 0  " ��Ҫ�ر������ļ���tags  

let Tlist_Enable_Fold_Column = 0    " ��Ҫ��ʾ�۵���  

autocmd FileType java set tags+=D:\tools\java\tags  

"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  

"let Tlist_Show_One_File=1            "��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ���

"����tags  

set tags=tags  

"set autochdir 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"��������

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Ĭ�ϴ�Taglist 

let Tlist_Auto_Open=1 

"""""""""""""""""""""""""""""" 

" Tag list (ctags) 

"""""""""""""""""""""""""""""""" 

let Tlist_Ctags_Cmd = '/usr/bin/ctags' 

let Tlist_Show_One_File = 1 "��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ��� 

let Tlist_Exit_OnlyWindow = 1 "���taglist���������һ�����ڣ����˳�vim 

let Tlist_Use_Right_Window = 1 "���Ҳര������ʾtaglist����

" minibufexpl�����һ������

let g:miniBufExplMapWindowNavVim = 1

let g:miniBufExplMapWindowNavArrows = 1

let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1




"2018-8-24 9:45����
"��������
behave mswin

"���ÿ��ٱ༭_vimrc�ļ���e�༭_vimrc
map <silent> <leader>e:call SwitchToBuf("~/_vimrc")<cr>

"����_vimrc�ļ�����Զ������µ�_vimrc
autocmd! bufwritepost .vimrc source ~/_vimrc

"����vim�����ε���
set noerrorbells

"GNU��׼
au BufEnter /usr/* call GnuIndent()

"�������
autocmd GUIEnter * simalt ~ x


"2018-8-24 10:20����
"���� gvim ����
"set guifont=��������:h15
set guifont=Courier_New:h15:cANSI   " �������� Courier_New
"set gfn=Tlwg\Typist:h16

"2018-8-24 11:50����
"vimĬ�ϱ���λ��
exec 'cd ' . fnameescape('G:\MyFile\Demo')
" �Զ��л�Ŀ¼Ϊ��ǰ�༭�ļ�����Ŀ¼
"au BufRead,BufNewFile,BufEnter * cd %:p:h

"��ɫ����
"colorscheme torte
"colorscheme desert

"
"
"
"2018-11-18 20:30����
"
set guifont=Inconsolata:h17





"2018-11-18 20:40����Python����
"
"
"
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


func HeaderPython()  
	""HeaderPython�����ڲ��������ò���ȷcall setline(1,"#!/usr/bin/env python")
	call append(1,"#---coding:utf-8---")
	call append(2,"# Author: Rick")
	call append(3,"# zhang_blue@foxmail.com   ") 
	call append(4,"# ".strftime('%Y-%m-%d %T',localtime())) 
	normal G 
	normal o
	normal o 
endfunc 
autocmd bufnewfile *.py call HeaderPython()



















