" Sanity check
if !has('nvim')
    Plug 'tpope/vim-sensible'
endif

" Autocomplete engine
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" _Install plugins
call plug#begin()
" Code
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } " Autocomplete
Plug 'romainl/vim-cool' " Stop matching after search is done
"Plug 'jiangmiao/auto-pairs' " Autocomplete brackets
Plug 'zchee/deoplete-go', { 'do': 'make'} " Go autocomplete
Plug 'zchee/deoplete-jedi' " Autocompletion and static analysis
Plug 'w0rp/ale' " Asynchronous Lint Engine
"Plug 'Shougo/neoinclude.vim' " Snippets
"Plug 'Shougo/neosnippet.vim' " Community snippets
"Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets' " Community snippets
Plug 'Chiel92/vim-autoformat' " Easy code formatting TODO: use it
Plug 'sbdchd/neoformat' " Format code
"Plug 'rizzatti/dash.vim' " Search Dash app
Plug 'sheerun/vim-polyglot' " Language pack

" Looks
Plug 'bling/vim-bufferline' " TODO: doesn't show anything
"Plug 'ryanoasis/vim-devicons' TODO: doesn't work
Plug 'ayu-theme/ayu-vim' " Theme
Plug 'vim-airline/vim-airline' " Nice looking status bar on the bottom
Plug 'vim-airline/vim-airline-themes' " TODO: not sure if need

" Syntax
"Plug 'isobit/vim-caddyfile' " Caddyfile syntax support

" Moving
Plug 'easymotion/vim-easymotion' " Vim motions on speed
Plug 'haya14busa/incsearch.vim' " Improved incremental searching
Plug 'haya14busa/incsearch-easymotion.vim'

" Utility
Plug 'scrooloose/nerdcommenter' " Quick comments TODO: use it
Plug 'unblevable/quick-scope' " Highlight f, F jumps
"Plug 'tweekmonster/startuptime.vim' " Profile startup time
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Interactive command execution
"Plug 'junegunn/goyo.vim' " Distraction free writing
"Plug 'rking/ag.vim' " Lightining fast :Ag searcher
"Plug 'mbbill/undotree' " History visualiser
Plug 'tpope/vim-repeat' " Enable repeating supported plugin maps
Plug 'christoomey/vim-titlecase' " Titlecase text
Plug 'tpope/vim-surround' " Quoting/parenthesizing made simple
Plug 'junegunn/vim-easy-align'
"Plug 'godlygeek/tabular' " Text filtering and alignment
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim' " fzf fuzzy search
"Plug 'danro/rename.vim' " Allow to :Rename files
"Plug 'scrooloose/nerdtree' " Sidebar view
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tpope/vim-vinegar'
"Plug 'justinmk/vim-dirvish' " Directory viewer
"Plug 'justinmk/vim-sneak'
"Plug 'junegunn/limelight.vim' " Highlight only active paragraphs
"Plug 'jiangmiao/auto-pairs' " TODO: make it not work in vimrc
"Plug 'tpope/vim-unimpaired' " TODO: doesn't work
"Plug 'terryma/vim-multiple-cursors'
"Plug 'dhruvasagar/vim-table-mode' " Insant table creation
"Plug 'tpope/vim-abolish' " TODO: not sure if need
"Plug 'ludovicchabant/vim-gutentags' " TODO: use it
Plug 'wakatime/vim-wakatime' " Track code time

" C 
Plug 'zchee/deoplete-clang', { 'for': 'c,cpp,objc' }

" Latex
"Plug 'lervag/vimtex', { 'for': 'tex' }

" Javascript
"Plug 'ternjs/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
"Plug 'carlitux/deoplete-ternjs', {'for': 'javascript', 'do': 'npm install -g tern'}

" Typescript
"Plug 'Quramy/tsuquyomi', {'for': 'typescript'}
"Plug 'Shougo/vimproc.vim', { 'for': 'typescript', 'build' : 'make'} " tsuquyomi dep

" Rust
"Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Go
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'}

" Vim
Plug 'Shougo/neco-vim', { 'for': 'vim' }

" Nix
"Plug 'LnL7/vim-nix', { 'for': 'nix' }

" Git
Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'mhinz/vim-signify' " 
Plug 'airblade/vim-gitgutter' " Show git diff in the gutter (sign column)
"Plug 'gregsexton/gitv' 
call plug#end()

let g:polyglot_disabled = ['go' , 'latex']

" _Basic config
filetype plugin indent on

set mouse=a
set undofile

set wildmenu
set wildmode=longest:list,full

" Easier navig
set number
set relativenumber

set updatetime=250 " NOTE: maybe needs increase

set visualbell

" TODO: not sure
set rtp^=/usr/share/vim/vimfiles
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
set rtp+=$GOPATH/src/github.com/junegunn/fzf

" TODO: Check if some of these settings come as default with neovim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " Nice looking editor
set clipboard^=unnamed  " Copy text to system clipboard
set gdefault " Always do global substitutions
set clipboard^=unnamedplus
set title " Set terminal title
set whichwrap+=<,>,[,]
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set completeopt-=preview " No annoying scratch preview above
set expandtab " Spaces on tabs
set shiftwidth=4
set softtabstop=2
set backspace=indent,eol,start " Makes backspace key more powerful
set undolevels=1000
set smartindent " Indentation
set shortmess=Ia " Disable startup message

" Open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

:autocmd InsertEnter,InsertLeave * set cul! " Notify on mode change visually

" Buffers
set hidden

" Folding
set foldcolumn=1
set foldlevel=20
set foldlevelstart=7
set foldmethod=syntax
set foldignore=""
set nofoldenable

" Searching
set wrapscan
set incsearch
set ignorecase
set smartcase
set gdefault

set hlsearch " Highlighting

" Usable 'Tab'
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set autoindent

set fileencoding=utf-8 " Encoding when written to file

" Line endings
set fileformat=unix

" Completion
if has('nvim')
    set completeopt+=menu,menuone
endif

" Set terminal title
set title

set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

set viewoptions=cursor,slash,unix

"  _Basic UI config
set relativenumber " Relative to current posion line numbers
set number " Show line numbers
set cursorline  " Highlight current line
let python_highlight_all = 1
set showmatch
set tabstop=4 " Default indentation is 4 spaces long and uses tabs, not spaces
set matchtime=2
set termguicolors " Enable true colors support

"  _Plugin modifications
let g:deoplete#enable_at_startup = 1 " Activate deoplete

" _Theme
set background=dark " Set night mode
let ayucolor="dark" " For mirage version of theme
colorscheme ayu

" _Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='minimalist' " Status bar theme
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

let g:airline#extensions#tabline#tab_min_count = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 2

" Bufferline
let g:bufferline_echo = 0

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
    if exists('g:deoplete#disable_auto_complete')
        let g:deoplete#disable_auto_complete = 1
    endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
    if exists('g:deoplete#disable_auto_complete')
        let g:deoplete#disable_auto_complete = 0
    endif
endfunction

" _Plugin settings
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutToggle = '<C-P>'
au filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", '`':'`'} " Don't autocomplete in vim

" JSX
let g:jsx_ext_required = 0

" Tern
let g:tern_request_timeout = 1

" Vim-session
let g:session_autosave="no"
let g:session_autoload="no"

" Autocomplete with tab
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Activate leader for easymotion
map <Leader> <Plug>(easymotion-prefix)

" Run goimports on save
let g:go_fmt_command = "goimports"

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)

" _Comma mapping

" _Insert  mapping
inoremap      jk  <Esc>
inoremap      kj  <Esc>
inoremap (<Space>  ();<Esc>hi
inoremap      (;   ();<Esc>o
inoremap      ()   ()

"_Command mapping
cabbrev rp Rp

" _Control mapping
nnoremap <C-M> /sticky 
nnoremap <C-L> /\c__\_sKeyCode::/e<Left><Left>

" _Space mapping
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"
let maplocalleader = "\<Space>"

nnoremap <leader>= yypVr=

" Fix yank
noremap Y y$ 

nmap <Leader>ze   :enew <CR>
nmap <Leader>zt   :tabnew<CR>
nmap <Leader>d   :bd<CR>

nmap <Leader>e.   :e .<CR>
nmap <Leader>to   :e %:p:h<CR>

" Buffer control
nmap <Leader>s    :bprevious<CR>
nmap <Leader>n    :bnext<CR>
"nmap <Leader>qb   :bp<BAR> bd #<CR>

" Formatting
nmap <Leader>af   :Autoformat<CR>

" FZF
"command! -nargs= 1 Locate call fzf#run({'source': 'locate <q-args>', 'sink': 'e', 'options': '-m'})
nmap <Leader>fb   :Buffers <CR>
nmap <Leader>o    :Files %:p:h<CR>
nmap <Leader>O    :GFiles <CR>
nmap <Leader>fl   :BLines <CR>
nmap <Leader>fL   :Lines <CR>
nmap <Leader>fh   :History<CR>
nmap <Leader>f;   :History:<CR>
nmap <Leader>f:   :Commands<CR>
nmap <Leader>ft   :BTags<CR>
nmap <Leader>fT   :Tags<CR>
nmap <Leader>fm   :Marks<CR>
nmap <Leader>fw   :Windows<CR>
nmap <Leader>fs   :Snippets<CR>
nmap <Leader>fg   :BCommits<CR>
nmap <Leader>fG   :Commits<CR>

" Mapping selecting mappings
nnoremap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Incsearch
let g:incsearch#auto_nohlsearch = 1
" map           /   <Plug>(incsearch-easymotion-/)
" map           ?   <Plug>(incsearch-easymotion-?)
map           g/  <Plug>(incsearch-easymotion-stay)
"map           /   <Plug>(incsearch-forward)
"map           ?   <Plug>(incsearch-backward)
"map           g/  <Plug>(incsearch-stay)
map           *   <Plug>(incsearch-nohl-*)
map           n   <Plug>(incsearch-nohl-n)
map           N   <Plug>(incsearch-nohl-N)
map           #   <Plug>(incsearch-nohl-#)
map           g*  <Plug>(incsearch-nohl-g*)
map           g#  <Plug>(incsearch-nohl-g#)

" Save
nmap <Leader>w :w<CR> 
" Search lines with fzf
nnoremap <silent> <Leader>n :Lines<CR>
" Quit
nnoremap <Leader>q :q<CR>  
" Yank whole file
nnoremap <Leader>y :%y<CR> 
" Source vimrc
nnoremap <Leader>ff :source ~/.dotfiles/nvim/init.vim<CR> 
" Search files inside current dir
nnoremap <Leader>e :Files<CR> 
" Switch dir for fzf searching to current dir
map <Leader>cd :lcd %:p:h<CR>
" Yank xml block to next line
nnoremap <Leader>aw  vat:t'><CR>'[<Esc><CR> 
" Yank function block
nnoremap <Leader>yf :exe search('^function','cb')';/}/y'<CR> 
" Dash doc lookup
nnoremap <Leader>at :Dash<CR>
" Write all changed buffers
nnoremap <Leader>aa :wa<CR>
" Write all changed buffers and exit vim
nnoremap <Leader>vq :wqall<CR>
nnoremap <Leader>vQ :qa<CR>
" Install plugins
nnoremap <Leader>ii :PlugInstall<CR>
" Update plugins
nnoremap <Leader>iu :PlugUpdate<CR>
" Check vim health
nnoremap <Leader>ih :CheckHealth<CR>
" Move 10 lines down (for karabiner sticky keys)
nnoremap <Leader>o 29jzz
" Update plugins
nnoremap <Leader>vm :make<CR>
" Run commands in new splits
nnoremap <Leader>tt :tabedit <Bar> term.
nnoremap <Leader>ts :split <Bar> term.
nnoremap <Leader>tv :vsplit <Bar> term.
"nnoremap <silent><expr> <C-L> winnr()==g:NERDTree.GetWinNum() ? ":NERDTreeClose\<CR>" : ":NERDTreeFocus\<CR>"
nnoremap <C-s> :w<cr>
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pu :PlugUpdate<CR>

" _Command + shift mapping
nnoremap <D-S-F> :Ack<space>

" EasyMotion
let g:EasyMotion_keys='hjkluiobnmxcvwersdfg'
let g:EasyMotion_startofline = 0
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

"map            f  <Plug>(easymotion-f)
"map            F  <Plug>(easymotion-F)
"map            t  <Plug>(easymotion-t)
"map            T  <Plug>(easymotion-T)
"map            s  <Plug>(easymotion-s2)
"map            S  <Plug>(easymotion-overwin-f2)
""map    <Leader>w  <Plug>(easymotion-w)
"map    <Leader>W  <Plug>(easymotion-W)
"map    <Leader>b  <Plug>(easymotion-b)
"map    <Leader>B  <Plug>(easymotion-B)
"map    <Leader>e  <Plug>(easymotion-e)
"map    <Leader>E  <Plug>(easymotion-E)
"map    <Leader>ge <Plug>(easymotion-ge)
"map    <Leader>gE <Plug>(easymotion-gE)
"
"map    <Leader>gl <Plug>(easymotion-overwin-line)
"
"map    <Leader>gn <Plug>(easymotion-next)
"map    <Leader>gN <Plug>(easymotion-prev)
" map    <Leader>n  <Plug>(easymotion-vim-n)
" map    <Leader>N  <Plug>(easymotion-vim-N)
"
""map    <Leader>h  <Plug>(easymotion-linebackward)
""map    <Leader>l  <Plug>(easymotion-lineforward)

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Neosnippet
let g:neosnippet#disable_runtime_snippets = { "_": 1, }
let g:neosnippet#snippets_directory='~/.local/share/nvim/plugins/vim-snippets/snippets'

" NOTE: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" NOTE: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=nc
endif

let g:tex_conceal="ag"
let g:vimtex_view_method='zathura'

nmap <localleader>ll <plug>(vimtex-compile-ss)

" _Easymotion
nmap J <Plug>(easymotion-j)
nmap K <Plug>(easymotion-k)
vmap J <Plug>(easymotion-j)
vmap K <Plug>(easymotion-k)

"let g:sneak#s_next = 1
"let g:sneak#use_ic_scs = 1
"let g:sneak#label = 1
"let g:sneak#target_labels = 'hjkluiobnmxcvwersdfg'
"autocmd ColorScheme * hi Sneak guifg=black guibg=red ctermfg=black ctermbg=red
"autocmd ColorScheme * hi SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow


" Filetype-specific keybinds TODO: migrate to /ft
au FileType sh         inoremap <buffer> ## <Esc>79i#<Esc>yypO#<Space>
au FileType conf       inoremap <buffer> ## <Esc>79i#<Esc>yypO#<Space>

au FileType dirvish call fugitive#detect(@%)

" Func
au FocusLost * :wa

" Filetype-specific settings
"au FileType html setlocal foldmethod=indent
au FileType typescript setlocal noexpandtab

" _Testing
let g:sneak#s_next = 1
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)
" Search and replace
xnoremap gs y:%s/<C-r>"//g<Left><Left> 

" See open buffers
nnoremap gb :ls<CR>:buffer<Space> 

set guicursor=n-v-c:hor20,i-ci:ver20 " Make cursor block in insert mode and underline in normal mode
autocmd VimLeave * set guicursor=a:ver25-blinkon25

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T'] " Trigger a highlight in the appropriate direction when pressing these keys
let g:qs_highlight_on_keys = ['f', 'F'] " Trigger a highlight only when pressing f and F.

noremap Q @q
vnoremap <D-c> y
set timeout timeoutlen=1000 ttimeoutlen=10 " TODO: ?
set showcmd " Show me what I'm typing
set autowrite " Automatically save before :next, :make etc
set ignorecase " Search case insensitive:
set smartcase " .. but not when search pattern contains upper case characters
set nocursorcolumn
set nocursorline
set wrap
set textwidth=79
set formatoptions=qrn1
set notimeout
set ttimeout
set ttimeoutlen=10
set nobackup " Don't create annoying backup files
set path=+** " Search down into subfolders
