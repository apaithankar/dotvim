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
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
execute pathogen#infect()
" set cursorline
set number
set background=dark
" set background=light
" let g:solarized_termtrans=1
set t_Co=256
syntax on
" color desert
" color mayansmoke
" colorscheme solarized
" colorscheme cleanroom
colorscheme gruvbox
" silent! colorscheme inori
" colorscheme hemisu
" colorscheme ir_black
" colorscheme pyte
" colorscheme molokai
" setlocal spell spelllang=en_us
" set spell
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
