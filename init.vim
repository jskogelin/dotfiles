call plug#begin('~/.local/share/nvim/plugged')
 
" plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'raimondi/delimitmate'
Plug 'kana/vim-textobj-user'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-dispatch'
Plug 'codeindulgence/vim-tig'
Plug 'junegunn/goyo.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'craigemery/vim-autotag'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'kshenoy/vim-signature'
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
Plug 'rakr/vim-togglebg'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'

" git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" syntax stuff
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'lepture/vim-jinja'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'kana/vim-textobj-function'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-speeddating'
Plug 'posva/vim-vue'
Plug 'nikvdp/ejs-syntax'
Plug 'w0rp/ale'
Plug 'rust-lang/rust.vim'

" color schemes
Plug 'arcticicestudio/nord-vim'

call plug#end()

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

" color scheme setup
syntax on
set t_Co=256
colorscheme nord

let g:nord_underline = 1

" settings
filetype plugin indent on
set autoindent
set smartindent
set cindent
set number
set nowrap
set linebreak
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
" set list
set tabstop=2
set shiftwidth=2
set expandtab
set showmatch
set relativenumber
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set shell=zsh
set noswapfile
" dont change cursor in insert mode - thank god
set guicursor=
language en_US

" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" Hopefully fixes ack going bananas sometimes
let g:ack_use_dispatch = 1

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" airline setup
" set laststatus=2
" let g:airline_powerline_fonts = 1

" function! GitBranch()
  " return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
" endfunction
" 
" function! StatuslineGit()
  " let l:branchname = GitBranch()
  " return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
" endfunction
" 
" set statusline=
" set statusline+=%1*\ <<
" set statusline+=%1*\ %{StatuslineGit()}
" set statusline+=%1*\ >>
" set statusline+=\ %F
" 
" hi User1 guifg=#000000 guibg=#faf8f5
" 
" lightline
" let g:lightline = {
      " \ 'colorscheme': 'one',
      " \ 'active': {
      " \   'left': [ [ 'mode', 'paste' ],
      " \             [ 'readonly', 'filename' ] ],
      " \  'right': [ [ 'modified', 'gitbranch' ] ]
      " \ },
      " \ 'component_function': {
      " \   'gitbranch': 'fugitive#head'
      " \ },
      " \ }

" NerdTree setup
" let g:NERDTreeWinPos = "right"

" Deoplete
let g:deoplete#enable_at_startup = 1

" ctrlp ignore stuff
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" indent
" let g:indentLine_char = ''
" let g:indentLine_first_char = ''
" let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_setColors = 0

" map leader to spacebar, \ is a pain to reach...
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"

" map save
nnoremap <Leader>s :wa<CR>

" emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" keybinds
noremap 0 ^
vnoremap <C-c> "+y

nnoremap Q :q<CR>

" expand region
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Open NerdTree
map <C-k><C-b> :NERDTreeToggle<CR>
map <Leader>ff :NERDTreeFind<CR>

nnoremap = <C-w>=

" Indentation stuff
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
map <C-p> :Files<CR>
map E :Files<CR>
map e :Buffers<CR>
map <C-f> :Ag 

" search
vnoremap <C-f> y :Ag <C-r>0<CR>

" tig
nnoremap <leader>ts :Tig<CR>
nnoremap <leader>tl :Tig!<CR>

" source config
nnoremap <leader>r :source ~/.config/nvim/init.vim<CR>

" fugitive
nnoremap <leader>fc :Gcommit<CR>
nnoremap <leader>fd :Gdiff<CR>
nnoremap <leader>fb :Gblame<CR>
nnoremap <leader>fo :Git checkout 

" themes
nnoremap <leader>bl :colorscheme onehalflight<CR>
nnoremap <leader>bd :colorscheme onehalfdark<CR>

" move lines
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" panes
nnoremap L <C-W><C-L>
nnoremap H <C-W><C-H>

" NERDcommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

let g:vue_disable_pre_processors=1

" delimitmate
let delimitMate_expand_cr = 1

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 ' --path-to-ignore ~/.ignore ',
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" tig
let g:tig_open_command = 'tabedit'
let g:tig_on_exit = 'tabclose'

" snippets
ab cons console.log

" call togglebg#map('<C-b><C-t>')
