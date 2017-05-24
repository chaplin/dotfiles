let mapleader=","

set autoread
set ruler
set number
set cursorline                           "underline the current line in the file
set cursorcolumn                         "highlight the current column. Visible in GUI mode only.
set colorcolumn=80
set clipboard+=unnamed
set backspace=2
set title " Show the filename in the window titlebar
set ttyfast " Send more characters at a given time
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest " Complete only until point of ambiguity

set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

set foldcolumn=0 " Column to show folds
set foldenable " Enable folding
set foldlevel=0 " Close all folds by default
set foldmethod=syntax " Syntax are used to specify folds
set foldminlines=0 " Allow folding single lines
set foldnestmax=5 " Set max fold nesting level

set hlsearch " Highlight searches
set incsearch " Highlight dynamically as pattern is typed
set wrapscan "wrap around serch results
set noshowmode " Don't show the current mode (airline.vim takes care of us)

set nowrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
augroup buffer_control
  " Buffer navigation (,,) (gb) (gB) (,ls)
  map <Leader>, <C-^>
  map <Leader>ls :buffers<CR>
  map gb :bnext<CR>
  map gB :bprev<CR>
  
  " Jump to buffer number (<N>gb) {{{
  let c = 1
  while c <= 99
    execute "nnoremap " . c . "gb :" . c . "b\<CR>"
    let c += 1
  endwhile
  " }}}

augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Theme, Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set background=dark
colorscheme hybrid_material 

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8 nobomb " BOM often causes trouble

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Relative numbers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
set relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set showtabline=2 " Always show tab bar
set softtabstop=2 " Tab key results in 2 spaces

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""
" => Center search results 
""""""""""""""""""""""""""""""
"
nnoremap n nzz
nnoremap N Nzz

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ \ %r%{getcwd()}%h

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
     return ''
endfunction

""""""""""""""""""""""""""""""
" => Copy file path 
""""""""""""""""""""""""""""""
"
" Expand current file path

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeToggle | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <Leader>n <plug>NERDTreeTabsToggle<CR>
nmap ,m :NERDTreeFind<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Emmet.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP.vim {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
augroup ctrlp_config
  autocmd!
  let g:ctrlp_clear_cache_on_exit = 0 " Do not clear filenames cache, to improve CtrlP startup
  let g:ctrlp_lazy_update = 350 " Set delay to prevent extra search
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } " Use python fuzzy matcher for better performance
  let g:ctrlp_match_window_bottom = 0 " Show at top of window
  let g:ctrlp_max_files = 0 " Set no file limit, we are building a big project
  let g:ctrlp_switch_buffer = 'Et' " Jump to tab AND buffer if already open
  let g:ctrlp_open_new_file = 'r' " Open newly created files in the current window
  let g:ctrlp_open_multiple_files = 'ij' " Open multiple files in hidden buffers, and jump to the first one
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
augroup airline_config
  autocmd!
  let g:airline_theme= 'luna'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#syntastic#enabled= 1
  let g:airline#extensions#tabline#buffer_nr_format = '%s '
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline_skip_empty_sections = 1
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic.vim 
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
augroup syntastic_config
  autocmd!
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_warning_symbol = '⚠'
  let g:syntastic_html_tidy_exec = 'tidy5'
  let g:loaded_syntastic_scss_sass_checker = 1
augroup END



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A minimalist Vim plugin manager.

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'othree/html5.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'wincent/command-t'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kristijanhusak/vim-hybrid-material'

" Initialize plugin system
call plug#end()

