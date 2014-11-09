set tags=tags
set ignorecase
set tabstop=3
set shiftwidth=3
set expandtab
map OH <Home>
map OF <End>
set hlsearch
set cindent
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
set t_Co=256
let g:solarized_termtrans=1
colorscheme solarized
" colorscheme cleanroom
setlocal spell spelllang=en_us
set spell
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
set ruler
set formatoptions+=r
if has ("autocmd")
   filetype plugin indent on
endif
" set <F8> to highlight all words matching the string under cursor
nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
" set <F5> to list all open buffers
nnoremap <F5> :buffers<CR>:buffer<Space>
" nnoremap <F6> :files<CR>:file<Space>
" quick save
nnoremap <F2> :w<CR>
" quick grep
nnoremap <silent> <F3> :Grep<CR>
" mouse and wheel settings
set mouse=n
map <M-Esc>[62~ <MouseDown>
map! <M-Esc>[62~ <MouseDown>
map <M-Esc>[63~ <MouseUp>
map! <M-Esc>[63~ <MouseUp>
map <M-Esc>[64~ <S-MouseDown>
map! <M-Esc>[64~ <S-MouseDown>
map <M-Esc>[65~ <S-MouseUp>
map! <M-Esc>[65~ <S-MouseUp>
au BufRead traces* setf traces
