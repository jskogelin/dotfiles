call plug#begin('~/.local/share/nvim/plugged')

" plugins
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'raimondi/delimitmate'
Plug 'kana/vim-textobj-user'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'terryma/vim-expand-region'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'tpope/vim-dispatch'
Plug 'codeindulgence/vim-tig'
Plug 'junegunn/goyo.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'craigemery/vim-autotag'

" git stuff
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" syntax stuff
Plug 'pangloss/vim-javascript'
Plug 'lepture/vim-jinja'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'kana/vim-textobj-function'
Plug 'leafgarland/typescript-vim'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

" color schemes
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'challenger-deep-theme/vim'

call plug#end()

" settings
filetype plugin indent on
set autoindent
set smartindent
set cindent
set number
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
" set list
set tabstop=2
set shiftwidth=2
set expandtab
set showmatch
set relativenumber
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set shell=/bin/bash
set noswapfile
" dont change cursor in insert mode - thank god
set guicursor=
language en_US

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
set termguicolors

" color scheme setup
syntax on
colorscheme gruvbox
let g:nord_allow_italics = 1
let g:nord_comment_brightness = 12
set background=dark

" neomake
let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost,BufEnter * Neomake

" Hopefully fixes ack going bananas sometimes
let g:ack_use_dispatch = 1

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" airline setup
" set laststatus=2
" let g:airline_powerline_fonts = 1

" lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" NerdTree setup
let g:NERDTreeWinPos = "right"

" Deoplete
let g:deoplete#enable_at_startup = 1

" ctrlp ignore stuff
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" keybinds
noremap 0 ^

" expand region
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Open NerdTree
map <C-k><C-b> :NERDTreeToggle<CR>
map <Leader>ff :NERDTreeFind<CR>

" Indentation stuff
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" tig
nnoremap <leader>ts :Tig<CR>
nnoremap <leader>tl :Tig!<CR>

" fugitive
nnoremap <leader>fc :Gcommit<CR>
nnoremap <leader>fd :Gdiff<CR>
nnoremap <leader>fb :Gblame<CR>

" themes
nnoremap <leader>bl :set background=light <CR>
nnoremap <leader>bd :set background=dark<CR>

" NERDcommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

" delimitmate
let delimitMate_expand_cr = 1

" fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
map <C-p> :Files<CR>
map <C-e> :Buffers<CR>
map <C-f> :Ag<CR>

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 ' --path-to-ignore ~/.ignore ',
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" tig
let g:tig_open_command = 'tabedit'
let g:tig_on_exit = 'tabclose'
