call plug#begin('~/.local/share/nvim/plugged')
 
" plugins
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'mfussenegger/nvim-lint'
Plug 'nvim-telescope/telescope.nvim'

" Completion
Plug 'hrsh7th/nvim-compe'

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
Plug 'rhysd/git-messenger.vim'

" git stuff
Plug 'tanvirtin/vgit.nvim'

" color schemes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sainnhe/gruvbox-material'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'rose-pine/neovim'
Plug 'folke/tokyonight.nvim'
Plug 'projekt0n/github-nvim-theme'

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
let g:gruvbox_material_background = 'hard'

" color scheme setup
syntax on
set t_Co=256
set background=dark
colo tokyonight

hi Normal guibg=NONE ctermbg=NONE

" Color scheme custom stuff
" highlight Function gui=bold
" highlight jsThis gui=bold
highlight String gui=italic
highlight Comment gui=italic

let g:fzf_preview_window = ['right:30%']
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'horizontal' } }

" coc.nvim config
set hidden
set updatetime=150
set signcolumn=yes
set nobackup
set nowritebackup
" highlight symbol under cursor on CursorHold
" this plays well with the updatetime setting
" autocmd CursorHold * silent call CocActionAsync('highlight')
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
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set shell=zsh
set noswapfile
set mouse=a
set number relativenumber
set undofile
set cursorline
set guicursor=
set diffopt+=vertical
language en_US

" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" vue stuff
autocmd FileType vue syntax sync fromstart
autocmd BufReadPost,BufNewFile *.vue setlocal filetype=vue

au BufWritePost <buffer> lua require('lint').try_lint()

" coc.nvim keybinds
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gvd :vsp<CR><Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gR <Plug>(coc-references)
" nmap <silent> gn <Plug>(coc-rename)
" " Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent> <space>p  :<C-u>CocList -I symbols<cr>
" " Use K to show documentation in preview window
" nnoremap <C-k> :call <SID>show_documentation()<CR>

" function! s:show_documentation()
  " if (index(['vim','help'], &filetype) >= 0)
    " execute 'h '.expand('<cword>')
  " else
    " call CocAction('doHover')
  " endif
" endfunction

nmap <silent> gb <Plug>(git-messenger)

"Status-line
" set statusline=
" set statusline+=\ %#IncSearch#
" set statusline+=\ %y
" set statusline+=\ %r
" set statusline+=%#CursorLineNr#
" set statusline+=\ %f
" set statusline+=\ %m
" set statusline+=%= "Right side settings
" set statusline+=%#Search#
" set statusline+=\ %l/%L
" set statusline+=\ [%c]

" map leader to spacebar, \ is a pain to reach...
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"

" map save
nnoremap <Leader>s :wa<CR>

nnoremap <Leader>H  :<C-u>Hist<cr>
nnoremap <Leader>F  :<C-u>Files<cr>

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
map S :GFiles?<CR>
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
" nnoremap <leader>fc :Gcommit<CR>
" nnoremap <leader>fd :Gdiff<CR>
" nnoremap <leader>fb :Gblame<CR>
" nnoremap <leader>fo :Git checkout 

"VGit
nnoremap <space>gd :VGit buffer_hunk_lens<CR>
nnoremap <space>gs :VGit buffer_hunk_stage<CR>
nnoremap <space>gr :VGit buffer_hunk_reset<CR>
nnoremap <space>gb :VGit buffer_stage<CR>

"NvimTree
nnoremap <space>e :NvimTreeToggle<CR>
let g:nvim_tree_side = 'right'
let g:nvim_tree_width = 40

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

lua << EOF
require('vgit').setup()

vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  }
}
require'lspconfig'.vuels.setup{}
require'lspconfig'.tsserver.setup{}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'vuels', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup {
  view = {
    mappings = {
      list = {
        { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
        { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
        { key = "<C-v>",                        cb = tree_cb("vsplit") },
        { key = "<C-x>",                        cb = tree_cb("split") },
        { key = "<C-t>",                        cb = tree_cb("tabnew") },
        { key = "<",                            cb = tree_cb("prev_sibling") },
        { key = ">",                            cb = tree_cb("next_sibling") },
        { key = "P",                            cb = tree_cb("parent_node") },
        { key = "<BS>",                         cb = tree_cb("close_node") },
        { key = "h",                            cb = tree_cb("close_node") },
        { key = "l",                            cb = tree_cb("open_node") },
        { key = "<Tab>",                        cb = tree_cb("preview") },
        { key = "K",                            cb = tree_cb("first_sibling") },
        { key = "J",                            cb = tree_cb("last_sibling") },
        { key = "I",                            cb = tree_cb("toggle_ignored") },
        { key = "R",                            cb = tree_cb("refresh") },
        { key = "a",                            cb = tree_cb("create") },
        { key = "d",                            cb = tree_cb("remove") },
        { key = "r",                            cb = tree_cb("rename") },
        { key = "<C-r>",                        cb = tree_cb("full_rename") },
        { key = "x",                            cb = tree_cb("cut") },
        { key = "c",                            cb = tree_cb("copy") },
        { key = "p",                            cb = tree_cb("paste") },
        { key = "y",                            cb = tree_cb("copy_name") },
        { key = "Y",                            cb = tree_cb("copy_path") },
        { key = "gy",                           cb = tree_cb("copy_absolute_path") },
        { key = "[c",                           cb = tree_cb("prev_git_item") },
        { key = "]c",                           cb = tree_cb("next_git_item") },
        { key = "-",                            cb = tree_cb("dir_up") },
        { key = "s",                            cb = tree_cb("system_open") },
        { key = "q",                            cb = tree_cb("close") },
        { key = "g?",                           cb = tree_cb("toggle_help") },
      }
    }
  }
}

require('lualine').setup {
  options = {
    theme = 'tokyonight',
    section_separators = '',
    component_separators = ''
  }
}
local lint = require('lint')
lint.linters.eslint.cmd = './node_modules/.bin/eslint'

lint.linters_by_ft = {
  javascript = {'eslint',};
  vue = {'eslint',};
}

vim.cmd([[au BufEnter *.js lua require('lint').try_lint() ]])
vim.cmd([[au BufWritePost *.js lua require('lint').try_lint() ]])
vim.cmd([[au BufEnter *.vue lua require('lint').try_lint() ]])
vim.cmd([[au BufWritePost *.vue lua require('lint').try_lint() ]])
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

