"  _Testing
" t t t t 
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']
nmap J <Plug>(easymotion-j)
nmap K <Plug>(easymotion-k)
vmap J <Plug>(easymotion-j)
vmap K <Plug>(easymotion-k)
noremap Q @q
vnoremap <D-c> y
set timeout timeoutlen=1000 ttimeoutlen=10        " NOTE: Faster esc - maybe
set showcmd                                       " Show me what I'm typing
set autowrite                                     " Automatically save before :next, :make etc
set ignorecase                                    " Search case insensitive
set smartcase                                     " .. but not when search pattern contains upper case characters
set nocursorcolumn
set nocursorline
set wrap
set textwidth=79
set formatoptions=qrn1
set notimeout
set ttimeout
set ttimeoutlen=10
set nobackup                                      " Don't create annoying backup files
set path=+**                                      " Search down into subfolders

"  _Install
call plug#begin() " plugins to use

" Autocomplete engine
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" _Plugs
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-titlecase' 
Plug 'unblevable/quick-scope' 
Plug 'ayu-theme/ayu-vim'          " theme
Plug 'jiangmiao/auto-pairs'
"Plug 'mbbill/undotree'
Plug 'wakatime/vim-wakatime'
Plug 'junegunn/heytmux'
Plug 'sbdchd/neoformat'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'danro/rename.vim'                             " Allow to :Rename files
Plug 'rking/ag.vim'                                 " Lightining fast :Ag searcher
Plug 'sheerun/vim-polyglot'
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'pangloss/vim-javascript'
Plug 'zchee/deoplete-jedi'
Plug 'tpope/vim-surround' 
Plug 'szw/vim-g'                                    " Search selected text in google
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'                      " Nice looking status bar on the bottom
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'carlitux/deoplete-ternjs'                    " JS autocomplete

call plug#end()


" _Basic vim config
"  TODO: Check if some of these settings come as default with neovim
let $NVIM_TUI_ENABLE_TRUE_COLOR=1                                          " Nice looking editor
set clipboard^=unnamed                                " Copy text to system clipboard
set guicursor=
set gdefault " always do global substitutions
set clipboard^=unnamedplus
set title                                         " Set terminal title
set whichwrap+=<,>,[,]
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set completeopt-=preview                          " No annoying scratch preview above
set expandtab                                     " Spaces on tabs
set shiftwidth=4
set softtabstop=2
set backspace=indent,eol,start                    " Makes backspace key more powerful
set undolevels=1000
set smartindent                                   " Indentation
set shortmess=Ia                                  " Disable startup message

" Open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

:autocmd InsertEnter,InsertLeave * set cul!       " Notify on mode change visually

"  _Comma mapping

"  _Insert  mapping
inoremap      jk  <Esc>
inoremap      kj  <Esc>
inoremap (<Space>  ();<Esc>hi
inoremap      (;   ();<Esc>o
inoremap      ()   ()

"  _Command mapping
cabbrev rp Rp

"  _Control mapping
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
vmap <C-d> :Dash<CR>
vmap <C-e> :Files<CR>

let g:ctrlp_map = '<c-k>'
let g:ctrlp_cmd = 'CtrlP'

"  _Space mapping
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"
nnoremap <leader>= yypVr=
nnoremap <leader>vimrc :tabe ~/.dotfiles/vim/nvim/nvimrc<cr>

" _Single letter 
" Save
nmap <Leader>w    :w<CR>   
" Search lines with fzf
nnoremap <silent> <Leader>l        :Lines<CR>
" Quit
nnoremap <Leader>q    :q<CR>  
" Yank whole file
nnoremap <Leader>y    :%y<CR> 
" Source vimrc
nnoremap <Leader>f   :source ~/.dotfiles/nvim/init.vim<CR> 
" Search files inside current dir
nnoremap <Leader>e    :Files<CR> 
" Switch dir for fzf searching to current dir
map <Leader>cd :lcd %:p:h<CR>
" Yank xml block to next line
nnoremap <Leader>aw    vat:t'><CR>'[<Esc><CR> 
" Yank function block
nnoremap <Leader>yf    :exe search('^function','cb')';/}/y'<CR> 
" Dash doc lookup
nnoremap <Leader>at   :Dash<CR>
nnoremap <Leader>aa   :wa<CR>
nnoremap <Leader>vq   :wqall<CR>
nnoremap <Leader>vQ   :qa<CR>
" Install plugins
nnoremap <Leader>ii   :PlugInstall<CR>
" Check vim health
nnoremap <Leader>ih   :CheckHealth<CR>
" Move 10 lines down (for karabiner sticky keys)
nnoremap <Leader>o   29jzz
" Update plugins
nnoremap <Leader>ia   :PlugUpdate<CR>
nnoremap <Leader>vm   :make<CR>
" Run commands in new splits
nnoremap <Leader>tt :tabedit <Bar> term.
nnoremap <Leader>ts :split <Bar> term.
nnoremap <Leader>tv :vsplit <Bar> term.
nnoremap <silent><expr> <C-L> winnr()==g:NERDTree.GetWinNum() ? ":NERDTreeClose\<CR>" : ":NERDTreeFocus\<CR>"
nnoremap <C-s> :w<cr>
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pu :PlugUpdate<CR>
" --------------------------------------
"  _Command + shift mapping
nnoremap <D-S-F> :Ack<space>

" -------------------------------------
"  _Basic UI config
" -------------------------------------
set relativenumber                    " Relative to current posion line numbers
set number                            " Show line numbers
set cursorline                        " Highlight current line
let python_highlight_all = 1
set showmatch
set tabstop=4                         " Default indentation is 4 spaces long and uses tabs, not spaces
set matchtime=2
set background=dark                   " Set night mode

"  _Settings
let g:deoplete#enable_at_startup = 1               " Activate deoplete

" _Theme
set termguicolors     " Enable true colors support
let ayucolor="mirage" " For mirage version of theme
colorscheme ayu

" Autocomplete with tab
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Activate leader for easymotion
map <Leader> <Plug>(easymotion-prefix)

" Run goimports on save
let g:go_fmt_command = "goimports"

" _Fzf
" Mapping selecting mappings
nnoremap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)
