call plug#begin('~/.local/share/nvim/plugged')
 
" plugins
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvimdev/lspsaga.nvim', { 'branch': 'main' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'mfussenegger/nvim-lint'
Plug 'nvim-telescope/telescope.nvim'
Plug 'RRethy/vim-illuminate'
Plug 'nvim-tree/nvim-web-devicons'

" Completion
" Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.0.0'}
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'mrcjkb/rustaceanvim', { 'version': '^4', 'ft': 'rust' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'raimondi/delimitmate'
Plug 'kana/vim-textobj-user'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'tpope/vim-dispatch'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'wellle/targets.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'rhysd/git-messenger.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-sleuth'
Plug 'numToStr/Comment.nvim'
Plug 'j-hui/fidget.nvim'

" git stuff
" Plug 'tanvirtin/vgit.nvim'
Plug 'NeogitOrg/neogit'
Plug 'lewis6991/gitsigns.nvim'
Plug 'sindrets/diffview.nvim'

" color schemes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'folke/tokyonight.nvim'
Plug 'savq/melange'
Plug 'projekt0n/github-nvim-theme'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'tomasiser/vim-code-dark'
Plug 'sainnhe/everforest'
Plug 'rebelot/kanagawa.nvim'
Plug 'sainnhe/sonokai'
Plug 'morhetz/gruvbox'
Plug 'bluz71/vim-moonfly-colors', { 'branch': 'cterm-compat' }
Plug 'lourenci/github-colors'
Plug 'Yazeed1s/oh-lucy.nvim'
Plug 'Mofiqul/vscode.nvim'
Plug 'RRethy/nvim-base16'

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

let g:go_doc_popup_window = 1

let g:palenight_terminal_italics=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_sign_column='bg0'
let g:gruvbox_material_background = 'hard'

let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1

lua << EOF
require('lspsaga').setup({
  symbol_in_winbar = {
    enable = false
    }
})
require('github-theme').setup()
vim.cmd('colorscheme github_dark_default')
-- vim.cmd[[colorscheme tokyonight]]
-- vim.cmd('colorscheme base16-gruvbox-material-dark-soft')
-- local c = require('vscode.colors').get_colors()
-- require('vscode').setup({
--     -- Alternatively set style in setup
--     -- style = 'light'
--
--     -- Enable transparent background
--     transparent = true,
--
--     -- Enable italic comment
--     italic_comments = true,
--
--     -- Disable nvim-tree background color
--     disable_nvimtree_bg = true,
--
--     -- Override colors (see ./lua/vscode/colors.lua)
--     color_overrides = {
--         vscLineNumber = '#FFFFFF',
--     }
-- })
--
-- require('vscode').load()
EOF

" let g:everforest_background = 'hard'

" color scheme setup
syntax on
set t_Co=256

" set winbar=%f\ %m

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

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

au TextYankPost * silent! lua vim.highlight.on_yank()

" settings
filetype plugin indent on
set autoindent
set smartindent
set cindent
set nowrap
set linebreak
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
" set list
set tabstop=2
set shiftwidth=2
set expandtab
set showmatch
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set shell=zsh
set noswapfile
set mouse=a
" set number relativenumber
set undofile
set cursorline
set diffopt+=vertical
set fillchars+=diff:╱
set shortmess+=I
language en_US

" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" vue stuff
" autocmd FileType vue syntax sync fromstart
" autocmd BufReadPost,BufNewFile *.vue setlocal filetype=vue
autocmd BufRead,BufNewFile *.c,*.njk set filetype=html

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

nnoremap <Leader>F  :<C-u>Files<cr>
nnoremap <C-n> :set number! relativenumber!<CR>

" keybinds
noremap 0 ^
vnoremap <C-c> "+y

nnoremap Q :q<CR>
nnoremap ; :

" expand region

" Balance split sizes
nnoremap = <C-w>=

" Indentation stuff
nnoremap <C-p> <C-i>
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

map E :Telescope find_files<CR>
map e :Telescope buffers<CR>
map <C-f> :Telescope live_grep<CR>
map F :Telescope grep_string<CR>
map <leader>ds :Telescope lsp_document_symbols<CR>
map <leader>gb :Telescope git_branches<CR>
map <leader>gc :Telescope git_bcommits<CR>
map <Leader>H :Telescope oldfiles<CR>
map <Leader>reg :Telescope registers<CR>
command Hist :Telescope oldfiles
command H :Telescope oldfiles
map K :lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <C-v> :vsplit<CR> :lua vim.lsp.buf.definition()<CR>
nnoremap gvd :vsplit<CR> :lua vim.lsp.buf.definition()<CR>

hi link IlluminatedWordText Visual
hi link IlluminatedWordRead Visual
hi link IlluminatedWordWrite Visual

" fzf keybinds
" map E :GFiles<CR>
" map e :Buffers<CR>
" map <C-f> :Ag 

" search
" vnoremap <leader>F yiw :Ag <C-r>0<CR>

" source config
nnoremap <leader>R :source ~/.config/nvim/init.vim<CR>

" fugitive
" nnoremap <leader>fc :Gcommit<CR>
" nnoremap <leader>fd :Gdiff<CR>
" nnoremap <leader>fb :Gblame<CR>
" nnoremap <leader>fo :Git checkout 

"VGit
nnoremap <space>gs :VGit buffer_hunk_stage<CR>
nnoremap <space>gdo :DiffviewOpen<CR>
nnoremap <space>gho :DiffviewFileHistory<CR>
nnoremap <space>dv :DiffviewFileHistory %<CR>
nnoremap <space>dc :DiffviewClose<CR>
nnoremap ! :VGit buffer_hunk_reset<CR>

"NvimTree
nnoremap <space>e :NvimTreeToggle<CR>
nnoremap <space>F :NvimTreeFindFile<CR>
let g:nvim_tree_side = 'right'
let g:nvim_tree_width = 60

nnoremap <space>gi :FloatermNew --height=0.8 --width=0.8 --wintype=float tig<CR>
tnoremap <silent><C-b>   <C-\><C-n><C-W><C-K>
tnoremap <silent><C-t>   <C-\><C-n>:FloatermToggle<CR>
nnoremap <C-t> :FloatermToggle!<CR>
nnoremap <C-b> :FloatermShow<CR>

"Work specific stuff
nnoremap <leader>tt :FloatermNew --autoclose=0 npm run test:client<CR>

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

" snippets
ab cons console.log

lua << EOF
require('gitsigns').setup {
  signcolumn = true,
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 300
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Actions
    map('n', '<leader>P', gs.preview_hunk)
    map('n', '<leader>D', gs.diffthis)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
  end
}
vim.g.floaterm_height = 0.20
vim.g.floaterm_wintype = 'split'

require('illuminate').configure({
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    -- delay: delay in milliseconds
    delay = 300,
    -- filetype_overrides: filetype specific overrides.
    -- The keys are strings to represent the filetype while the values are tables that
    -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
    filetype_overrides = {},
    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    filetypes_denylist = {
        'dirvish',
        'fugitive',
    },
    -- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
    filetypes_allowlist = {},
    -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
    modes_denylist = {},
    -- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
    modes_allowlist = {},
    -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_denylist = {},
    -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
    -- Only applies to the 'regex' provider
    -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    providers_regex_syntax_allowlist = {},
    -- under_cursor: whether or not to illuminate under the cursor
    under_cursor = true,
})

require("mason").setup()

-- NVIM CMP
local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
  experimental = {
    ghost_text = true,
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- END NVIM CMP CONFIG

--[[
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
]]

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  }
}
require'lspconfig'.vuels.setup{}
require'lspconfig'.tailwindcss.setup{}
require'lspconfig'.tsserver.setup{
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}
require'lspconfig'.gopls.setup{}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local function goto_definition(split_cmd)
    local util = vim.lsp.util
    local log = require("vim.lsp.log")
    local api = vim.api

    -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
    local handler = function(_, result, ctx)
      if result == nil or vim.tbl_isempty(result) then
        local _ = log.info() and log.info(ctx.method, "No location found")
        return nil
      end

      if split_cmd then
        vim.cmd(split_cmd)
      end

      if vim.tbl_islist(result) then
        util.jump_to_location(result[1])
        if #result > 1 then
          util.set_qflist(util.locations_to_items(result))
          api.nvim_command("copen")
          api.nvim_command("wincmd p")
        end
      else
        util.jump_to_location(result)
      end
    end

    return handler
  end

  vim.lsp.handlers["textDocument/definition_split"] = goto_definition('split')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'P', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'W', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>W', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
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
    },
    capabilities = capabilities
  }
end

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  on_attach = my_on_attach,
}

require('lualine').setup {
  options = {
    theme = 'auto',
    section_separators = '',
    component_separators = '',
    globalstatus = true,
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1
      }
    }
  }
}
-- local lint = require('lint')
-- lint.linters_by_ft = {
--   typescript = {'eslint',};
--   javascript = {'eslint',};
--   vue = {'eslint',};
-- }
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })
--
-- vim.cmd([[au BufEnter *.js lua require('lint').try_lint() ]])
-- vim.cmd([[au BufWritePost *.js lua require('lint').try_lint() ]])
-- vim.cmd([[au BufEnter *.vue lua require('lint').try_lint() ]])
-- vim.cmd([[au BufWritePost *.vue lua require('lint').try_lint() ]])

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "lib/pdfjs" },
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close,
        ["<c-f>"] = actions.to_fuzzy_refine
      }
    }
  }
}

require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner"
      },
    },
  },
}

local keymap = vim.keymap.set

-- null-ls setup
local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
    sources = {
      null_ls.builtins.formatting.prettierd
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format({
                    bufnr = bufnr,
                    filter = function(client)
                        return client.name == "null-ls"
                    end
                  })
                end,
            })
        end
    end,
})
-- null-ls end

-- prettier stuff
-- local prettier = require("prettier")
--
-- prettier.setup({
--   bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
--   filetypes = {
--     "css",
--     "graphql",
--     "html",
--     "javascript",
--     "javascriptreact",
--     "json",
--     "less",
--     "markdown",
--     "scss",
--     "typescript",
--     "typescriptreact",
--     "yaml",
--     "vue",
--   },
-- })
-- prettier end

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- Code action
keymap({"n","v"}, "<leader>ld", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "gR", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
keymap("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap("n","<leader>o", "<cmd>LSoutlineToggle<CR>",{ silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- if you want pass somc cli command into terminal you can do like this
-- open lazygit in lspsaga float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
-- close floaterm
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })

vim.fn.sign_define(
  'DiagnosticSignError',
  { text = '👺', texthl = 'LspDiagnosticsDefaultError' }
)

vim.fn.sign_define(
  'DiagnosticSignWarn',
  { text = '🦆', texthl = 'LspDiagnosticsDefaultWarning' }
)

vim.fn.sign_define(
  'DiagnosticSignInfo',
  { text = '🦆', texthl = 'LspDiagnosticsDefaultInformation' }
)

vim.fn.sign_define(
  'DiagnosticSignHint',
  { text = '🦆', texthl = 'LspDiagnosticsDefaultHint' }
)

require('Comment').setup()
require"fidget".setup{}

local actions = require("diffview.actions")
require('diffview').setup({
  keymaps = {
    file_history_panel = {
      { "n", "<CR>",            actions.goto_file_edit,              { desc = "Open the file in the previous tabpage" } },
    }
  }
})
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Avoid showing message extra message when using completion
set shortmess+=c

" emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

function ToggleColors()
    if (g:colors_name == "github_light")
        colorscheme github_dark
    else
        colorscheme github_light
    endif
endfunction

nnoremap <leader>l :call ToggleColors()<CR>

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
