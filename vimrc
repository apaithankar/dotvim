set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'morhetz/gruvbox'
Plugin 'Cleanroom'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'wojciechkepka/vim-github-dark'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set tags=tags
set ignorecase
set tabstop=2
set shiftwidth=2
set expandtab
map OH <Home>
map OF <End>
set hlsearch
" set cindent
set smartindent
set autoindent
" Incremental search is irritating sometimes.
" set is
" set noswapfile
set dictionary+=/usr/share/dict/words
" set cursorline
set number

set t_Co=256
"set background=light
set background=dark
syntax on

" color desert
" color mayansmoke
" colorscheme solarized
" colorscheme cleanroom
" colorscheme gruvbox
" colorscheme ghdark
" silent! colorscheme inori
" colorscheme hemisu
" colorscheme ir_black
" colorscheme pyte
" colorscheme molokai
"
" setlocal spell spelllang=en_us
" set spell
"
" set termguicolors
"
let g:solarized_termtrans=1
"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
set ruler
set formatoptions+=r
" set <F8> to highlight all words matching the string under cursor
nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
" set <F7> to rebuild cscope database
nnoremap <F7> :!cscope -b<CR>:cs reset<CR><CR>
" set <F5> to list all open buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
" nnoremap <F6> :files<CR>:file<Space>
" quick save
nnoremap <F2> :w<CR>
" quick grep
nnoremap <silent> <F3> :Grep<CR>
" mouse and wheel settings
set mouse=n
" toggle to 'paste mode'
set pastetoggle=<F4>
map <M-Esc>[62~ <MouseDown>
map! <M-Esc>[62~ <MouseDown>
map <M-Esc>[63~ <MouseUp>
map! <M-Esc>[63~ <MouseUp>
map <M-Esc>[64~ <S-MouseDown>
map! <M-Esc>[64~ <S-MouseDown>
map <M-Esc>[65~ <S-MouseUp>
map! <M-Esc>[65~ <S-MouseUp>
au BufRead traces* setf traces
filetype plugin on
"" GO syntax highliting ""
let g:go_disable_autoinstall = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
set tags=TAGS

" Set a vertical bar at the column width = 80
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Support for protobuf files
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end
