" A lot of this comes from
" https://github.com/thoughtbot/dotfiles/blob/master/vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"filetype off
filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/snippets/*

" no annoying swp files
set nobackup
set nowritebackup
set noswapfile

set laststatus=2

set autowrite " automatically :write before running commands

" line numbers
set number

set ruler

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell

" scan some directories for 'find' and 'gf' 
set path+=./expressApp/**,./test/**
" suffixes to put to the end of the list when completing file names for find
set suffixes=.md,.js

" use system clipboard
set clipboard=unnamed

" show all search matches
set hlsearch

" don't wrap lines
set nowrap
set autoindent
set smarttab
set shiftwidth=4
set expandtab

" lets you use . to repeat things in visual mode
" from VIM primer by danielmiessler.com
vnoremap . :norm .<CR>

" go directly to line numbers in normal mode when numbers then
" enter is typed
nnoremap <CR> G

" in block mode, go past line endings
set virtualedit=block

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/node_modules/**
set wildignore+=*/.idea/**
set wildignore+=*DS_Store*
set wildignore+=*/build/**
set wildignore+=*/coverage/**
set wildignore+=*/logs/**
set wildignore+=*/bin/**

" if you forget what all the map commands are: 
" http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mexpressApping
" remap splits, idea from thoughtbot
" you can add <C-W>_ to the end of each of these to maximize/minimize splits
" automatically
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
" ctrl+i overrides jumptos, 
" TODO would be great to have another mexpressApping for <C-W>= to equalize splits, but what?
"nnoremap <C-I> <C-W>_

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" enter newlines in edit mode
"nmap <S-Enter> O<Esc>
"nmap <CR> o<Esc>

" make getting out of insert mode quicker
imap jk <Esc>

" shortcut to write file and get back to the spot in insert mode
imap jw <Esc>:w <CR>a

" get out of insert mode and save
" imap jw <Esc>:w<CR> 

" pressing 0 is faster than ^ and I like the behavior of ^ better to go to
" first word
map 0 ^
" map to 'real' middle of line: http://superuser.com/a/216476/297816
map gm :call cursor(0, len(getline('.'))/2)<CR>

" automatically start NERDTree and put it into the main window
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" make markdown *.md files have expressAppropriate syntax highligting
autocmd BufRead,BufNew *.md set filetype=markdown

" I like to move splits with my mouse, sue me...
set mouse=a
" help resizing splits with mouse in tmux
" see http://superuser.com/questions/549930/cant-resize-vim-splits-inside-tmux
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" tab navigation like firefox
" http://vim.wikia.com/wiki/Alternative_tab_navigation
nnoremap <C-S-T> :tabprevious<CR>
nnoremap <C-T>   :tabnext<CR>
inoremap <C-S-T> <Esc>:tabprevious<CR>i
inoremap <C-T>   <Esc>:tabnext<CR>i

" this will go through and find other vimrc's outside
" this primary one
for f in split(glob('~/.vimrc.*'), '\n')
  exe 'source' f
endfor
