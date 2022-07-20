
" set maptimeout 5
set autoindent              " indent a new line the same amount as the line just typed
set background=dark        " set background to dark:
set cc=80                  " set an 80 column border for good coding style
set encoding=utf-8         " set encoding to utf-7:
set expandtab               " converts tabs to white space
set hlsearch                " highlight search 
set ignorecase              " case insensitive 
set incsearch               " incremental search
set mouse=a                 " enable mouse clict
set mouse=v                 " middle-click paste with 
set nocompatible            " disable compatibility to old-time vi
set noswapfile            " disable creating swap file
set number                  " add line numbers
set relativenumber          " numbers relatvie to current positions
set scrolloff=8            " width for autoindents
set shiftwidth=4            " width for autoindents
set showmatch               " show matching 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set tabstop=4               " number of columns occupied by a tab 
set timeoutlen=500 ttimeoutlen=0
set title
set updatetime=200
set wildmode=longest,list   " get bash-like tab completions

""""""""""""splits""""""""""""""""""""""
" set splitright splitbelow 
set splitright 

filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set clipboard+=unnamedplus

" set clipboard=unnamedplus   " using system clipboard
let mapleader = " "
nmap <leader>w :w!<cr>
nmap <leader>qq :BD<cr>
nmap <leader>qa :bufdo bd<cr>
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>
" nmap <leader>hh :bprevious<cr>

"disable mappings of gitgutter
"that slows down switching buffers
map <leader>hs <Nop>
map <leader>hu <Nop>
map <leader>hp <Nop>

" for command mode
"
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

" map <Enter> o<ESC>          " insert blank line by Enter
" map <S-Enter> O<ESC>

" Restore last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set backupdir=~/.cache/vim " Directory to store backup files.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Plugin Section
 Plug 'SirVer/ultisnips'
 Plug 'airblade/vim-gitgutter'
 Plug 'altercation/vim-colors-solarized'
 Plug 'dracula/vim'
 Plug 'honza/vim-snippets'
 Plug 'joshdick/onedark.vim'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'machakann/vim-highlightedyank'
 Plug 'mfussenegger/nvim-dap'
 Plug 'mhinz/vim-startify'
 Plug 'mihaifm/bufstop'
 Plug 'morhetz/gruvbox'
 Plug 'nanotech/jellybeans.vim'
 Plug 'neoclide/coc-eslint'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'overcache/NeoSolarized'
 Plug 'preservim/nerdcommenter'
 Plug 'prettier/vim-prettier', {
             \ 'do': 'yarn install --frozen-lockfile --production',
             \ }
 Plug 'puremourning/vimspector'
 Plug 'qpkorr/vim-bufkill'
 Plug 'scrooloose/nerdtree'
 Plug 'sickill/vim-monokai'
 Plug 'tmhedberg/SimpylFold'
 Plug 'tpope/vim-commentary'
 Plug 'vim-airline/vim-airline'
 Plug 'voldikss/vim-floaterm'
 Plug 'wookayin/fzf-ripgrep.vim'
 Plug 'godlygeek/tabular'
 Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
 Plug 'nvim-lua/plenary.nvim'
 " telescope
 Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'kyazdani42/nvim-web-devicons'
 Plug 'PhilRunninger/nerdtree-visual-selection'
 Plug 'ryanoasis/vim-devicons'
 Plug 'Shatur/neovim-session-manager'
 call plug#end()

 " set guifont=DroidSansMono\ Nerd\ Font\ 11

" let g:highlightedyank_highlight_duration = 1000
let g:floaterm_keymap_toggle = '<leader>t'
let g:floaterm_height=0.8

"-----------FROM coc>>start
"----------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Don't pass messages to |ins-completion-menu|.k
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> T :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"------------
"------------FROM coc <<end

" highlight DiagnosticWarn ctermfg=Red  guifg=#ff0000
" highlight DiagnosticError ctermfg=Red  guifg=#ff0000
colorscheme industry" set color scheme to indusry:

" highlight CocWarningSign guifg=#000000
" highlight CocErrorSign guifg=#000000

" highlight CocErrorSign guifg=#d1666a
" highlight CocWarningSign guifg=#d1cd66
" highlight CocInfoSign guibg=#353b45
" highlight CocHintSign guifg=#f1ed86
" highlight CocHintSign guifg=#f1ed86
highlight NormalFloat ctermfg=0 ctermbg=7 guibg=White

" highlight CocWarningSign guifg=#d1cd66
" highlight CocWarningSign guifg=#d1cd66
" highlight CocWarningSign guifg=#d1cd66

"Vim inspector settings
"let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
"xmap <F6> <Plug>VimspectorStop
"map <F6> <Plug>VimspectorStop
nmap <F5> <Plug>VimspectorContinue
nmap <A-F5> <Plug>VimspectorContinue
noremap <F17> <Plug>VimspectorStop
nmap <F6> <Plug>VimspectorPause  
nmap <F9> <Plug>VimspectorToggleBreakpoint
nmap <F10> <Plug>VimspectorStepOver
nmap <F11> <Plug>VimspectorStepInto
nmap <F21> <Plug>VimspectorAddFunctionBreakpoint
nmap <F23> <Plug>VimspectorStepOut
nmap <Leader>di <Plug>VimspectorBalloonEval
xmap <Leader>di <Plug>VimspectorBalloonEval

" <Plug>VimspectorStop
" <Plug>VimspectorRestart
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__'] "ignore files in NERDTree                                     

" Prettier configs
let g:prettier#quickfix_enabled = 0
autocmd BufWritePre *.py,*.tsx,*.js,*.jsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Moving lines
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-j> :m .+1<CR>==gi
nnoremap <A-j> :m .+1<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <S-j> :m '>+1<CR>gv=gv
nnoremap <S-j> :m .+1<CR>==
" inoremap <A-k> <Esc>:m .-2<CR>==gi

inoremap <A-k> :m .-2<CR>==gi
nnoremap <S-k> :m .-2<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" Keymap Coc
nmap <leader>tt <Plug>(coc-format)
vmap <leader>tt <Plug>(coc-format)
xmap <leader>tt <Plug>(coc-format)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

" Nerdtree navigation
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" GitGutter
let g:gitgutter_override_sign_column_highlight = 1

" Autocomplete
" inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
" inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

" Window navigation
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-l> :wincmd l<CR>
nmap <silent> <c-h> :wincmd h<CR>

" Fzf maps
" map <Leader>ff :Files<CR>
" map <Leader>fb :BLines<CR>
" map <Leader>fa :Rg<CR>
" map <Leader>fg :Lines<CR>

"use telescope instead
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"let $FZF_DEFAULT_COMMAND = 'fd --type f'

" Buffers navigation
map <leader>b :Bufstop<CR>
let g:BufstopAutoSpeedToggle = 1

"splits
"resize vertical +
"resize horizontal -
"resize vertical +10
"ctrl-w -
"ctrl-w +
"ctrl-w >
"ctrl-w <
"ctrl-w 10 +
"ctrl-w = (equal size)
"ctrl-w _ (maximum height)
"ctrl-w | (maximum width)
"
"formatting
":call CocAction('format')


" MarkdownPreview configuration
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = '/usr/bin/firefox'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'dark'
