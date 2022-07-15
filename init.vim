" set maptimeout 5
set autoindent              " indent a new line the same amount as the line just typed
set background=dark       " set background to dark:
set cc=80                  " set an 80 column border for good coding style
set encoding=utf-8                           
set expandtab               " converts tabs to white space
set hlsearch                " highlight search 
set ignorecase              " case insensitive 
set incsearch               " incremental search
set mouse=a                 " enable mouse click
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
set updatetime=200
set wildmode=longest,list   " get bash-like tab completions



filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set clipboard=unnamedplus   " using system clipboard
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
 Plug 'ryanoasis/vim-devicons'
 Plug 'scrooloose/nerdtree'
 Plug 'sickill/vim-monokai'
 Plug 'tmhedberg/SimpylFold'
 Plug 'tpope/vim-commentary'
 Plug 'vim-airline/vim-airline'
 Plug 'voldikss/vim-floaterm'
 Plug 'wookayin/fzf-ripgrep.vim'
 call plug#end()

colorscheme industry" set color scheme to indusry:

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
map <Leader>ff :Files<CR>
map <Leader>fb :BLines<CR>
map <Leader>fa :Rg<CR>
map <Leader>fg :Lines<CR>


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
