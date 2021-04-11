""""""""""""""""""""""""""""""""""""""""""""""""""
"                     Plugins                    "
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin for golang
" https://github.com/fatih/vim-go
" https://github.com/fatih/vim-go-tutorial
Plugin 'fatih/vim-go'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'      " enhance nerdtree's tabs
Plugin 'Xuyuanp/nerdtree-git-plugin'  " display git status within Nerdtree

Plugin 'easymotion/vim-easymotion'

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Color schemes
Plugin 'w0ng/vim-hybrid'
Plugin 'morhetz/gruvbox'
Plugin 'fatih/molokai'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件

""""""""""""""""""""""""""""""""""""""""""""""""""
"                Plugins Setting                 "
""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go 
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_enabled = ['golint']
"let g:go_metalinter_autosave_enabled = ['golint']
"let g:go_metalinter_autosave = 1

" setting ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|swp|pyc|pyo)$',
  \ }
if executable('ag')
  " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
  " and .agignore. Ignores hidden files by default.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
else
  "ctrl+p ignore files in .gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>


" setting vim theme
set background=dark
silent! colorscheme hybrid
set t_Co=256


" setting vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 1
function! ArilineInit()
    let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
    let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%F'])
    "let g:airline_section_c = airline#section#create(['filetype'])
    let g:airline_section_x = airline#section#create(['%P'])
    let g:airline_section_y = airline#section#create(['%B'])
    let g:airline_section_z = airline#section#create_right(['%l', '%c'])
endfunction
autocmd VimEnter * call ArilineInit()


" easymotion
map s <Plug>(easymotion-s2)


" nerdtree config
map ge :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1    " Start NERDTree in minimal UI mode (No help lines)
let NERDTreeWinSize=30     " Initial NERDTree width
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '__pycache__']   " Hide temp files in NERDTree
" Close NERDTree when there's no other windows
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = { 
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
\ }


""""""""""""""""""""""""""""""""""""""""""""""""""
"                    Settings                    "
""""""""""""""""""""""""""""""""""""""""""""""""""
set number                      " Show line numbers
set hlsearch                    " Highlight found searches
set autoread                    " Automatically read changed files
set autowrite                   " Automatically save before :next, :make etc.
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set showcmd                     " Show me what I'm typing
set hidden                      " allows you to hide buffers with unsaved changes without being prompted
set formatoptions+=n            " smart auto-indenting inside numbered lists
set highlight+=c:LineNr         " blend vertical separators with line numbers
set lazyredraw                  " don't bother updating screen during macro playback
set mousehide                   " 输入文本时隐藏光标

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""
"                    Mappings                    "
""""""""""""""""""""""""""""""""""""""""""""""""""
"i      insert 在插入模式有效
"n      在普通模式有效  
"v      visual模式
"nore   表示非递归

" use ctrl+h/j/k/l switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" 设置 leader 键，默认为'/'
let mapleader=';'

" 使用 jj/kk 替代 esc
inoremap jj <Esc>`^
inoremap kk <Esc>`^

" 使用 leader + w(我的leader改成了逗号)，快速保存。无论是在 insert 还是 normal 模式
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>

" 使用 leader + q 实现退出
noremap <leader>q :wq<cr>
noremap <leader>1 :q!<cr>
inoremap <leader>q <Esc>:wq<cr>

" set go map
autocmd FileType go nmap <leader>b  <Plug>(go-build)
"autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>r :!go run %<cr>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" :GoDef but opens in a vertical split
autocmd FileType go nmap <leader>dv <Plug>(go-def-vertical)
" :GoDef but opens in a horizontal split
autocmd FileType go nmap <leader>ds <Plug>(go-def-split)


""""""""""""""""""""""""""""""""""""""""""""""""""
"                  For Languages                 "
""""""""""""""""""""""""""""""""""""""""""""""""""
" for go
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" for html
autocmd BufNewFile,BufRead *.html setlocal expandtab tabstop=2 shiftwidth=2

" for json
let g:vim_json_syntax_conceal = 0
autocmd FileType json,javascript,html,jsx,javascript.jsx setlocal ts=2 sts=2 sw=2 expandtab

" https://github.com/PegasusWang/linux_config/blob/master/mac/mac_vimrc

" 括号引号补全
" https://www.cnblogs.com/huanlei/archive/2012/04/02/2430153.html
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf

