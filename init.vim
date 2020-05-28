call plug#begin('~/.local/share/nvim/plugged')
 
" plugins
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'raimondi/delimitmate'
Plug 'kana/vim-textobj-user'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'tpope/vim-dispatch'
Plug 'iberianpig/tig-explorer.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'wellle/targets.vim'
Plug 'heavenshell/vim-jsdoc'

" git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

" color schemes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rafi/awesome-vim-colorschemes'

" syntax stuff
Plug 'sheerun/vim-polyglot'

call plug#end()

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

let g:palenight_terminal_italics=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_sign_column='bg0'

" color scheme setup
syntax on
set t_Co=256
set background=dark
colo gruvbox

hi Normal guibg=NONE ctermbg=NONE

" Color scheme custom stuff
" highlight Function gui=bold
" highlight jsThis gui=bold
highlight String gui=italic
highlight Comment gui=italic

" coc.nvim config
set hidden
set updatetime=150
set signcolumn=yes
set nobackup
set nowritebackup
" highlight symbol under cursor on CursorHold
" this plays well with the updatetime setting
autocmd CursorHold * silent call CocActionAsync('highlight')
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json', 
  \ 'coc-vetur', 
  \ 'coc-eslint', 
  \ 'coc-css', 
  \ 'coc-html', 
  \ ]

" settings
filetype plugin indent on
set autoindent
set smartindent
set cindent
set nowrap
set linebreak
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
set list
set tabstop=2
set shiftwidth=2
set expandtab
set showmatch
set guicursor=
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set shell=zsh
set noswapfile
set mouse=a
set number relativenumber
set undofile
set cursorline
language en_US

" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" vue stuff
autocmd FileType vue syntax sync fromstart

" coc.nvim keybinds
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gvd :vsp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gR <Plug>(coc-references)
nmap <leader>n <Plug>(coc-rename)
nmap <space>e :CocCommand explorer<CR>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>p  :<C-u>CocList -I symbols<cr>
" Use K to show documentation in preview window
nnoremap <C-k> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"Status-line
set statusline=
set statusline+=\ %{FugitiveHead()}
set statusline+=\ %#IncSearch#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#CursorLineNr#
set statusline+=\ %f
set statusline+=\ %m
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=\ %l/%L
set statusline+=\ [%c]

" map leader to spacebar, \ is a pain to reach...
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"

" map save
nnoremap <Leader>s :wa<CR>

nnoremap <Leader>H  :<C-u>Hist<cr>
nnoremap <Leader>F  :<C-u>Files<cr>

" emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" keybinds
noremap 0 ^
vnoremap <C-c> "+y

nnoremap Q :q<CR>
nnoremap ; :

" expand region

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>

" Balance split sizes
nnoremap = <C-w>=

" Indentation stuff
nnoremap <C-p> <C-i>
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" fzf keybinds
map E :GFiles<CR>
map e :Buffers<CR>
map <C-f> :Ag 

" search
vnoremap <leader>F yiw :Ag <C-r>0<CR>

" tig
nnoremap <leader>ts :TigOpenProjectRootDir<CR>
nnoremap <leader>tl :TigOpenCurrentFile<CR>

" source config
nnoremap <leader>R :source ~/.config/nvim/init.vim<CR>

" fugitive
nnoremap <leader>fc :Gcommit<CR>
nnoremap <leader>fd :Gdiff<CR>
nnoremap <leader>fb :Gblame<CR>
nnoremap <leader>fo :Git checkout 

" move lines
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" panes
nnoremap L <C-W><C-L>
nnoremap H <C-W><C-H>
nnoremap K <C-W><C-K>
nnoremap J <C-W><C-J>

" NERDcommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

let g:delimitMate_expand_cr = 1

let g:vue_disable_pre_processors=1

" tig
let g:tig_open_command = 'tabedit'
let g:tig_on_exit = 'tabclose'

" snippets
ab cons console.log

" call togglebg#map('<C-b><C-t>')
