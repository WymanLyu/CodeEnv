"
" A (not so) minimal vimrc.
"

" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

set number                 " Show number line.
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

set fdm=indent             " 代码折叠 zc/zo
set foldlevelstart=99      " 默认不要折叠（默认检查层数变大）

set tags=tags;/            " Ctags find from super 
"set fillchars=vert:\ 
"set fillchars+=vert:│
"highlight VertSplit ctermbg=NONE ctermfg=NONE guibg=NONE

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" Vundle
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'mhinz/vim-startify'
"Plugin 'scrooloose/nerdtree'
"Plugin 'kien/ctrlp.vim'
"Plugin 'dyng/ctrlsf.vim'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'morhetz/gruvbox'
"Plugin 'vim-airline/vim-airline'
"Plugin 'tenfyzhong/CompleteParameter.vim'
"call vundle#end()

call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
call plug#end()

colorscheme gruvbox
set background=dark    " Setting dark mode

let g:ctrlsf_default_root = 'project'
let g:ctrlsf_extra_root_markers = ['.projectRoot','.ycm_extra_conf.py']
let g:ctrlp_root_markers = ['.projectRoot','.ycm_extra_conf.py']
"默认配置文件路径"
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"打开vim时不再询问是否加载ycm_extra_conf.py配置"
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python解释器路径"
let g:ycm_path_to_python_interpreter='/usr/local/bin/python3'
let g:ycm_python_binary_path='/usr/local/bin/python3'
"是否开启语义补全"
let g:ycm_seed_identifiers_with_syntax=0
"是否在注释中也开启补全"
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=2
"补全后自动关机预览窗口"
let g:ycm_autoclose_preview_window_after_completion=1
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
" 关闭代码检查
let g:ycm_show_diagnostics_ui = 1
"字符串中也开启补全"
let g:ycm_complete_in_strings = 1
"离开插入模式后自动关闭预览窗口"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项"
let g:ycm_key_list_stop_completion = ['<CR>']
"inoremap <expr> <CR>       pumvisible() ? '\<C-y>' : '\<CR>'
"上下左右键行为"
"inoremap <expr> <Down>     pumvisible() ? '<C-n>' : '<Down>'
"inoremap <expr> <Up>       pumvisible() ? '<C-p>' : '<Up>'
"inoremap <expr> <PageDown> pumvisible() ? '<PageDown><C-p><C-n>' : '<PageDown>'
"inoremap <expr> <PageUp>   pumvisible() ? '<PageUp><C-p><C-n>' : '<PageUp>'
" 跳转到定义处, 分屏打开
"let g:ycm_goto_buffer_command = 'horizontal-split'
nnoremap <c-k> :YcmCompleter GoToDeclaration<CR>|
nnoremap <c-h> :YcmCompleter GoToDefinition<CR>|
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|
let g:ycm_semantic_triggers =  {
                        \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
                        \ 'cs,lua,javascript': ['re!\w{2}'],
                        \ }
"inoremap <silent><expr> ( complete_parameter#pre_complete("()")
"smap <Tab> <Plug>(complete_parameter#goto_next_parameter)
"imap <Tab> <Plug>(complete_parameter#goto_next_parameter)
"let g:complete_parameter_use_ultisnips_mapping = 0

" 快捷键
let mapleader=" "                         
map <leader>q :q<CR>
map <leader>0 :NERDTreeToggle<CR>
map <leader>j :NERDTreeFind<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>o :CtrlP<CR>
map <leader>h :vs<CR>
map <leader>v :sp<CR>
map <leader>/ <leader>cc
map <leader>/ <leader>ci
let g:ctrlp_cmd = 'CtrlP'
map f <Plug>CtrlSFPrompt
map F <Plug>CtrlSFQuickfixPrompt
let g:ctrlsf_auto_focus = {
    \ 'at': 'start',
    \ }
let g:ycm_filetype_whitelist = {
                        \ "c":1,
                        \ "cpp":1,
                        \ "objc":1,
                        \ "sh":1,
                        \ "zsh":1,
                        \ "zimbu":1,
                        \ "python":1,
                        \ }
















