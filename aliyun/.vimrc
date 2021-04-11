set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin for golang
" https://github.com/fatih/vim-go
" https://github.com/fatih/vim-go-tutorial
Plugin 'fatih/vim-go'

Plugin 'scrooloose/nerdtree'

Plugin 'w0ng/vim-hybrid'
Plugin 'morhetz/gruvbox'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件

" nerdtree config
map ge :NERDTreeToggle<CR>


" setting vim theme
set background=dark
colorscheme hybrid
set t_Co=256


""""""""""""""""""""""""""""""""""""""""""""""""""
"                    Settings                    "
""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
set hls
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set foldenable              " 开始折叠
set fdm=syntax              " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码

"set foldclose=all          " 设置为自动关闭折叠
""nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"                            " 用空格键来开关


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

