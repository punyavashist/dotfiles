" Autocomplete engine
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" _Install plugins
call plug#begin()
Plug 'tweekmonster/startuptime.vim' " Profile startup time. TODO: remove after
" Utility
Plug 'romainl/vim-cool' " Stop matching after search is done.
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
Plug 'w0rp/ale' " Asynchronous Lint Engine.
Plug 'honza/vim-snippets' " Snippet files for various programming languages.
Plug 'Chiel92/vim-autoformat' " Easy code formatting.
Plug 'sbdchd/neoformat' " Format code.
Plug 'rizzatti/dash.vim' " Search Dash app.
Plug 'jremmen/vim-ripgrep' " Use RipGrep in Vim and display results in a quickfix list.
Plug 'scrooloose/nerdcommenter' " Quick comments.
Plug 'unblevable/quick-scope' " Highlight f, F jumps.
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Interactive command execution.
Plug 'junegunn/goyo.vim' " Distraction free writing.
Plug 'tpope/vim-repeat' " Enable repeating supported plugin maps.
"Plug 'christoomey/vim-titlecase' " Titlecase text.
Plug 'tpope/vim-surround' " Quoting/parenthesizing made simple.
Plug 'junegunn/vim-easy-align' " Simple, easy-to-use alignment.
Plug '/usr/local/opt/fzf' " Fzf search.
Plug 'junegunn/fzf.vim' " Fzf search.
Plug 'wakatime/vim-wakatime' " Automatic time tracking.

" Moving
Plug 'easymotion/vim-easymotion' " Vim motions on speed.
Plug 'haya14busa/incsearch.vim' " Improved incremental searching.
Plug 'haya14busa/incsearch-easymotion.vim' " Incsearch & easymotion integration.

" Git
Plug 'tpope/vim-fugitive' " Git wrapper.
Plug 'mhinz/vim-signify' " Show a diff using Vim its sign column.

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } " Asynchronous completion framework.
Plug 'zchee/deoplete-jedi' " Deoplete source for jedi.

" C
Plug 'zchee/deoplete-clang', { 'for': 'c,cpp,objc' } 

" Looks
Plug 'ayu-theme/ayu-vim' " Theme
Plug 'vim-airline/vim-airline' " Lean & mean status/tabline.
Plug 'vim-airline/vim-airline-themes' " Collection of themes for Airline.

" Go
Plug 'fatih/vim-go', { 'for': 'go' } " Go development.
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'} " Asynchronous Go completion.

" Vim
Plug 'Shougo/neco-vim', { 'for': 'vim' } " Vim source for neocomplete/deoplete.

" Nix
Plug 'LnL7/vim-nix', { 'for': 'nix' } " Vim configuration files for Nix.
call plug#end()

" _Testing
" TODO: see what is applied by neovim already

set mouse=a " Copy selected text with mouse to system clipboard
set undofile

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
set ignorecase
set smartcase
set gdefault

" Usable 'Tab'
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

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

" _Basic UI config
set relativenumber " Relative to current posion line numbers
set number " Show line numbers
set cursorline  " Highlight current line
let python_highlight_all = 1
set showmatch
set tabstop=4 " Default indentation is 4 spaces long and uses tabs, not spaces
set matchtime=2
set termguicolors " Enable true colors support

" _Plugin modifications
let g:deoplete#enable_at_startup = 1 " Activate deoplete

" _Theme
set background=dark " Set night mode
let ayucolor="mirage" " For mirage version of theme
colorscheme ayu

" _Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow' " Status bar theme
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

" Better yank
noremap Y y$ 

" _lead z
nmap <Leader>ze   :enew <CR>
nmap <Leader>zt   :tabnew<CR>

" _lead d
nmap <Leader>d   :bd<CR>

" _lead e
nmap <Leader>e.   :e .<CR>

" _lead t
nmap <Leader>to   :e %:p:h<CR>

" _lead s
" Buffer control
nmap <Leader>s    :bprevious<CR>

" _lead n
nmap <Leader>n    :bnext<CR>

" _lead q
"nmap <Leader>qb   :bp<BAR> bd #<CR>

" _lead a
" Formatting
nmap <Leader>fw   :Autoformat<CR> 

" FZF
"command! -nargs= 1 Locate call fzf#run({'source': 'locate <q-args>', 'sink': 'e', 'options': '-m'})
" _lead f
nmap <Leader>ff :FZF <CR>
nmap <Leader>fb   :Buffers <CR>
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

" _lead o
nmap <Leader>o    :Files %:p:h<CR>
nmap <Leader>O    :GFiles <CR>

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
nnoremap <Leader>a :source ~/.dotfiles/nvim/init.vim<CR> 
" Search files inside current dir
nnoremap <Leader>e :Files<CR> 
" Switch dir for fzf searching to current dir
map <Leader>cd :lcd %:p:h<CR>
" Yank xml block to next line
nnoremap <Leader>tgt  vat:t'><CR>'[<Esc><CR> 
" Yank function block
nnoremap <Leader>tgt :exe search('^function','cb')';/}/y'<CR> 
" Dash doc lookup
nnoremap <Leader>ttt :Dash<CR>
" Write all changed buffers
nnoremap <Leader>tttt :wa<CR>
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
