" Start required settings for vundle set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" Repositories
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/taglist.vim'
Bundle 'scrooloose/syntastic'
Bundle 'L9'
Bundle 'ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'skammer/vim-css-color'
Bundle 'airblade/vim-gitgutter'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-surround'

" go dev env.
Bundle 'fatih/vim-go'

" Renames current buffer and local file
Bundle 'danro/rename.vim'
filetype plugin indent on
" End required settings for vundle

" Make vim more useful
set nocompatible
" Use 256 colors in vim
set t_Co=256
colorscheme railscasts
" Tab completion
set wildmode=list:longest,list:full
" Ignore some files
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
" Optimize for fast terminal connections
set ttyfast
" Change mapleader
let mapleader = ","
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
" Set tags directory
set tags=~/.vim/tags
let Tlist_Ctags_Cmd='/usr/bin/ctags'
" Enable line numbers
set number
" Show the cursor position
set ruler
" Enable syntax highlighting
syntax on
" Set encoding to utf-8
set encoding=utf-8
" Show invisible character
set listchars=tab:»·,trail:·
set list
" Highlight seach results
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Search with case if upper case is used
set smartcase
" Always show statusbar
set laststatus=2
" Start scrolling three lines before the horizontal window border
set scrolloff=3

set tabstop=2
set shiftwidth=2
set expandtab

au BufNewFile,BufRead *.hbs set filetype=html
au BufNewFile,BufRead *.scss set filetype=css

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif
" Indent code automatically
set autoindent
set smartindent
" Do not wrap long lines
set nowrap
" Make tabes as wide as four spaces
set tabstop=2 softtabstop=2 shiftwidth=2
" Tab according to sourrounding code
set smarttab
" Highlight trailing white space
highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+\%#\@<!$/
" Highlight UTF-8 chars that are out of range
match Error /[\x7f-\xff]/

" Previous tab
map <F1> gT
" Next tab
map <F2> gt
" Toggle linenumbers
map <silent><F5> :set number!<CR>
" Generate C tags
map <F7> :!echo "Generating C tags" && /usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --totals=yes %:p:h /usr/include/<CR>

function! CurrentWord()
    echo expand("<cWORD>")
endfunction

" Jump to pane below
map <C-J> <C-W>j
" Jump to pane above
map <C-K> <C-W>k
" Jump to pane to left
map <C-L> <C-W>l
" Jump to pane to right
map <C-H> <C-W>h
" Create a new split pane
map <C-b> :vsp<CR><C-W>l

" Use W for writing aswell
:command! W w

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
" inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" Use fancy fonts i vim-powerline
let g:Powerline_symbols = 'fancy'

" NERDTREE STUFF
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv


if has("gui_macvim")
  set fuoptions=maxvert,maxhorz
  set noballooneval

  " resize current buffer by +/- 5
  nnoremap <M-Right> :vertical resize +5<CR>
  nnoremap <M-Left>  :vertical resize -5<CR>
  nnoremap <M-Up>    :resize -5<CR>
  nnoremap <M-Down>  :resize +5<CR>

  " Command+Option+Right for next
  map <D-M-Right> :tabn<CR>
  " Command+Option+Left for previous
  map <D-M-Left> :tabp<CR>

  " Automatically resize splits
  " when resizing MacVim window
  autocmd VimResized * wincmd =
endif

let g:ycm_filetype_blacklist = {
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'md': 1,
      \ 'text': 1
      \ }
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
let g:ycm_collect_identifiers_from_tags_files=1