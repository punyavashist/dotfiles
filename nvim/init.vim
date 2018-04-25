" Autocomplete engine
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" _Install plugins
call plug#begin()
" Utility
Plug 'romainl/vim-cool' " Stop matching after search is done.
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair.
Plug 'w0rp/ale' " Asynchronous Lint Engine.
Plug 'honza/vim-snippets' " Snippet files for various programming languages.
Plug 'sbdchd/neoformat' " Format code.
Plug 'rizzatti/dash.vim' " Search Dash app.
Plug 'jremmen/vim-ripgrep' " Use RipGrep in Vim and display results in a quickfix list.
Plug 'scrooloose/nerdcommenter' " Quick comments.
Plug 'unblevable/quick-scope' " Highlight f, F jumps.
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Interactive command execution.
Plug 'tpope/vim-repeat' " Enable repeating supported plugin maps.
"Plug 'christoomey/vim-titlecase' " Titlecase text.
Plug 'tpope/vim-surround' " Quoting/parenthesizing made simple.
Plug 'junegunn/vim-easy-align' " Simple, easy-to-use alignment.
Plug '/usr/local/opt/fzf' " Fzf search.
Plug 'junegunn/fzf.vim' " Fzf search.
Plug 'wakatime/vim-wakatime' " Automatic time tracking.
Plug 'haya14busa/incsearch.vim' " Improved incremental searching.
Plug 'easymotion/vim-easymotion' " Vim motions on speed.
Plug 'thinca/vim-quickrun' " Run commands quickly.
Plug 'junegunn/goyo.vim' " Distraction-free writing.

" Git
Plug 'tpope/vim-fugitive' " Git wrapper.
Plug 'mhinz/vim-signify' " Show a diff using Vim its sign column.
Plug 'airblade/vim-gitgutter' " Shows git diff in the gutter (sign column) and stages/undoes hunks.

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } " Asynchronous completion framework.
Plug 'zchee/deoplete-jedi' " Deoplete source for jedi.

" C
Plug 'zchee/deoplete-clang', { 'for': 'c,cpp,objc' } 

" Looks
Plug 'ayu-theme/ayu-vim' " Theme.
Plug 'itchyny/lightline.vim' " Light and configurable statusline/tabline plugin.

" Go
Plug 'fatih/vim-go', { 'for': 'go' } " Go development.
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make'} " Asynchronous Go completion.

" Vim
Plug 'Shougo/neco-vim', { 'for': 'vim' } " Vim source for neocomplete/deoplete.

" Nix
Plug 'LnL7/vim-nix', { 'for': 'nix' } " Vim configuration files for Nix.
call plug#end()

" _Options
set mouse=a " Copy selected text with mouse to system clipboard
set undofile " Save undos after file closes
set wildmode=longest:list,full " Complete longest common string, then each full match
set updatetime=250 " If this many milliseconds nothing is typed the swap file will be written to disk
set visualbell " Turn off the audio bell
set clipboard^=unnamed  " Copy text to system clipboard
set gdefault " Always do global substitutions
set title " Set terminal title
set whichwrap+=<,>,[,]
set completeopt-=preview " No annoying scratch preview above
set expandtab " Spaces on tabs
set shiftwidth=4
set softtabstop=2
set undolevels=1000
set smartindent " Indentation
set shortmess=Ia " Disable startup message
set fileencoding=utf-8 " Encoding when written to file
set fileformat=unix " Line endings
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

" Folding
set foldcolumn=1
set foldlevel=20
set foldlevelstart=7
set foldmethod=syntax
set foldignore=""
set nofoldenable

" Buffers
set hidden

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

" UI
set number " Display line numbers
set relativenumber " Relative numbers
set cursorline  " Highlight current line
set showmatch
set tabstop=4 " Default indentation is 4 spaces long and uses tabs, not spaces
set matchtime=2
set termguicolors " Enable true colors support
let python_highlight_all = 1

set completeopt+=menu,menuone " Completion

let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " True color
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

:autocmd InsertEnter,InsertLeave * set cul! " Notify on mode change visually

set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m

set viewoptions=cursor,slash,unix

" _Plugins
let g:deoplete#enable_at_startup = 1 " Activate deoplete
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T'] " Trigger a highlight in the appropriate direction when pressing these keys
let g:incsearch#auto_nohlsearch = 1 " TODO:

" Theme
set background=dark " Set night mode
let ayucolor="mirage" " Mirage version of theme
colorscheme ayu

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

let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutToggle = '<C-P>'
au filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", '`':'`'} " Don't autocomplete in vim

" Vim session
let g:session_autosave="no"
let g:session_autoload="no"

" Autocomplete with tab
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Activate leader for easymotion
map <Leader> <Plug>(easymotion-prefix)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)

" _Insert mappings
inoremap      jk  <Esc>
inoremap      kj  <Esc>
inoremap      (;   ();<Esc>o
inoremap      ()   ()

"_Command mappings
cabbrev rp Rp

" _Control mappings
nnoremap <C-M> /sticky 
nnoremap <C-L> /\c__\_sKeyCode::/e<Left><Left>

" _Space mappings
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"
let maplocalleader = "\<Space>"
nnoremap <leader>= yypVr=

" _Space z
nmap <Leader>ze   :enew <CR>
nmap <Leader>zt   :tabnew<CR>

" _Space p
nnoremap <Leader>pi :PlugInstall<CR>
nnoremap <Leader>pu :PlugUpdate<CR>

" _Space w
" Save
nmap <Leader>w :w<CR> 

" _Space d
nmap <Leader>d   :bd<CR>

" _Space a
" Yank xml block to next line
nnoremap <Leader>aw  vat:t'><CR>'[<Esc><CR> 

" _Space v
" Write all changed buffers and exit vim
nnoremap <Leader>vq :wqall<CR>
nnoremap <Leader>vQ :qa<CR>
nnoremap <Leader>vm :make<CR>

" _Space o
" Move 10 lines down (for karabiner sticky keys)
nnoremap <Leader>o 29jzz

" _Space i
nnoremap <Leader>ii :PlugInstall<CR>
" Update plugins
nnoremap <Leader>iu :PlugUpdate<CR>
" Check vim health
nnoremap <Leader>ih :CheckHealth<CR>

" _Space c
" Switch dir for fzf searching to current dir
map <Leader>cd :lcd %:p:h<CR>

" _Space e
nmap <Leader>e.   :e .<CR>
" Search files inside current dir
nnoremap <Leader>e :Files<CR> 

" _Space t
nmap <Leader>to   :e %:p:h<CR>
" Yank function block
nnoremap <Leader>tgt :exe search('^function','cb')';/}/y'<CR> 
" Dash doc lookup
nnoremap <Leader>ttt :Dash<CR>
" Write all changed buffers
nnoremap <Leader>tttt :wa<CR>
" Run commands in new splits
nnoremap <Leader>tt :tabedit <Bar> term.
nnoremap <Leader>ts :split <Bar> term.
nnoremap <Leader>tv :vsplit <Bar> term.

" _Space s
" Buffer control
nmap <Leader>s    :bprevious<CR>
" Source vimrc
nnoremap <Leader>ss :source ~/.dotfiles/nvim/init.vim<CR> 

" _Space n
nmap <Leader>n    :bnext<CR>
" Search lines with fzf
nnoremap <silent> <Leader>n :Lines<CR>

" _Space q
nmap <Leader>q    :q<CR>

" _Space y
" Yank whole file
nnoremap <Leader>y :%y<CR> 

" _Space f
nmap <Leader>fw   :Autoformat<CR> 
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

" _Space o
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

" For conceal markers
if has('conceal')
    set conceallevel=2 concealcursor=nc
endif

" _Auto commands
au FileType dirvish call fugitive#detect(@%)
au FocusLost * :wa " Auto save everything

" _Remaps
" Search and replace
xnoremap gs y:%s/<C-r>"//g<Left><Left> 

" Yank a line with Y.
nnoremap Y y$

" _Functions

" _Other
set guicursor=n-v-c:hor20,i-ci:ver20 " Make cursor block in insert mode and underline in normal mode
autocmd VimLeave * set guicursor=a:ver25-blinkon25 " Make cursor block when leaving to shell

" _Testing
nnoremap <C-q> :q<cr>:q<cr>

let s:cpo_save = &cpo
set cpo&vim

function! s:const(val, min, max)
  return min([max([a:val, a:min]), a:max])
endfunction

function! s:get_color(group, attr)
  return synIDattr(synIDtrans(hlID(a:group)), a:attr)
endfunction

function! s:set_color(group, attr, color)
  let gui = has('gui_running') || has('termguicolors') && &termguicolors
  execute printf('hi %s %s%s=%s', a:group, gui ? 'gui' : 'cterm', a:attr, a:color)
endfunction

function! s:blank(repel)
  if bufwinnr(t:goyo_pads.r) <= bufwinnr(t:goyo_pads.l) + 1
    \ || bufwinnr(t:goyo_pads.b) <= bufwinnr(t:goyo_pads.t) + 3
    call s:goyo_off()
  endif
  execute 'wincmd' a:repel
endfunction

function! s:init_pad(command)
  execute a:command

  setlocal buftype=nofile bufhidden=wipe nomodifiable nobuflisted noswapfile
      \ nonu nocursorline nocursorcolumn winfixwidth winfixheight statusline=\ 
  if exists('&rnu')
    setlocal nornu
  endif
  if exists('&colorcolumn')
    setlocal colorcolumn=
  endif
  let bufnr = winbufnr(0)

  execute winnr('#') . 'wincmd w'
  return bufnr
endfunction

function! s:setup_pad(bufnr, vert, size, repel)
  let win = bufwinnr(a:bufnr)
  execute win . 'wincmd w'
  execute (a:vert ? 'vertical ' : '') . 'resize ' . max([0, a:size])
  augroup goyop
    execute 'autocmd WinEnter,CursorMoved <buffer> nested call s:blank("'.a:repel.'")'
    autocmd WinLeave <buffer> call s:hide_statusline()
  augroup END

  " To hide scrollbars of pad windows in GVim
  let diff = winheight(0) - line('$') - (has('gui_running') ? 2 : 0)
  if diff > 0
    setlocal modifiable
    call append(0, map(range(1, diff), '""'))
    normal! gg
    setlocal nomodifiable
  endif
  execute winnr('#') . 'wincmd w'
endfunction

function! s:resize_pads()
  augroup goyop
    autocmd!
  augroup END

  let t:goyo_dim.width = s:const(t:goyo_dim.width, 2, &columns)
  let t:goyo_dim.height = s:const(t:goyo_dim.height, 2, &lines)

  let vmargin = max([0, (&lines - t:goyo_dim.height) / 2 - 1])
  let yoff = s:const(t:goyo_dim.yoff, - vmargin, vmargin)
  let top = vmargin + yoff
  let bot = vmargin - yoff - 1
  call s:setup_pad(t:goyo_pads.t, 0, top, 'j')
  call s:setup_pad(t:goyo_pads.b, 0, bot, 'k')

  let nwidth  = max([len(string(line('$'))) + 1, &numberwidth])
  let width   = t:goyo_dim.width + (&number ? nwidth : 0)
  let hmargin = max([0, (&columns - width) / 2 - 1])
  let xoff    = s:const(t:goyo_dim.xoff, - hmargin, hmargin)
  call s:setup_pad(t:goyo_pads.l, 1, hmargin + xoff, 'l')
  call s:setup_pad(t:goyo_pads.r, 1, hmargin - xoff, 'h')
endfunction

function! s:tranquilize()
  let bg = s:get_color('Normal', 'bg#')
  for grp in ['NonText', 'FoldColumn', 'ColorColumn', 'VertSplit',
            \ 'StatusLine', 'StatusLineNC', 'SignColumn']
    " -1 on Vim / '' on GVim
    if bg == -1 || empty(bg)
      call s:set_color(grp, 'fg', get(g:, 'goyo_bg', 'black'))
      call s:set_color(grp, 'bg', 'NONE')
    else
      call s:set_color(grp, 'fg', bg)
      call s:set_color(grp, 'bg', bg)
    endif
    call s:set_color(grp, '', 'NONE')
  endfor
endfunction

function! s:hide_statusline()
  setlocal statusline=\ 
endfunction

function! s:hide_linenr()
  if !get(g:, 'goyo_linenr', 0)
    setlocal nonu
    if exists('&rnu')
      setlocal nornu
    endif
  endif
  if exists('&colorcolumn')
    setlocal colorcolumn=
  endif
endfunction

function! s:maps_nop()
  let mapped = filter(['R', 'H', 'J', 'K', 'L', '|', '_'],
                    \ "empty(maparg(\"\<c-w>\".v:val, 'n'))")
  for c in mapped
    execute 'nnoremap <c-w>'.escape(c, '|').' <nop>'
  endfor
  return mapped
endfunction

function! s:maps_resize()
  let commands = {
  \ '=': ':<c-u>let t:goyo_dim = <sid>parse_arg(t:goyo_dim_expr) <bar> call <sid>resize_pads()<cr>',
  \ '>': ':<c-u>let t:goyo_dim.width = winwidth(0) + 2 * v:count1 <bar> call <sid>resize_pads()<cr>',
  \ '<': ':<c-u>let t:goyo_dim.width = winwidth(0) - 2 * v:count1 <bar> call <sid>resize_pads()<cr>',
  \ '+': ':<c-u>let t:goyo_dim.height += 2 * v:count1 <bar> call <sid>resize_pads()<cr>',
  \ '-': ':<c-u>let t:goyo_dim.height -= 2 * v:count1 <bar> call <sid>resize_pads()<cr>'
  \ }
  let mapped = filter(keys(commands), "empty(maparg(\"\<c-w>\".v:val, 'n'))")
  for c in mapped
    execute 'nnoremap <silent> <c-w>'.c.' '.commands[c]
  endfor
  return mapped
endfunction

nnoremap <silent> <plug>(goyo-resize) :<c-u>call <sid>resize_pads()<cr>

function! s:goyo_on(dim)
  let dim = s:parse_arg(a:dim)
  if empty(dim)
    return
  endif

  let s:orig_tab = tabpagenr()
  let settings =
    \ { 'laststatus':    &laststatus,
    \   'showtabline':   &showtabline,
    \   'fillchars':     &fillchars,
    \   'winminwidth':   &winminwidth,
    \   'winwidth':      &winwidth,
    \   'winminheight':  &winminheight,
    \   'winheight':     &winheight,
    \   'ruler':         &ruler,
    \   'sidescroll':    &sidescroll,
    \   'sidescrolloff': &sidescrolloff
    \ }

  " New tab
  tab split

  let t:goyo_master = winbufnr(0)
  let t:goyo_dim = dim
  let t:goyo_dim_expr = a:dim
  let t:goyo_pads = {}
  let t:goyo_revert = settings
  let t:goyo_maps = extend(s:maps_nop(), s:maps_resize())
  if has('gui_running')
    let t:goyo_revert.guioptions = &guioptions
  endif

  " vim-gitgutter
  let t:goyo_disabled_gitgutter = get(g:, 'gitgutter_enabled', 0)
  if t:goyo_disabled_gitgutter
    silent! GitGutterDisable
  endif

  " vim-signify
  let t:goyo_disabled_signify = exists('b:sy') && b:sy.active
  if t:goyo_disabled_signify
    SignifyToggle
  endif

  " vim-airline
  let t:goyo_disabled_airline = exists('#airline')
  if t:goyo_disabled_airline
    AirlineToggle
  endif

  " vim-powerline
  let t:goyo_disabled_powerline = exists('#PowerlineMain')
  if t:goyo_disabled_powerline
    augroup PowerlineMain
      autocmd!
    augroup END
    augroup! PowerlineMain
  endif

  " lightline.vim
  let t:goyo_disabled_lightline = exists('#lightline')
  if t:goyo_disabled_lightline
    silent! call lightline#disable()
  endif

  call s:hide_linenr()
  " Global options
  let &winheight = max([&winminheight, 1])
  set winminheight=1
  set winheight=1
  set winminwidth=1 winwidth=1
  set laststatus=0
  set showtabline=0
  set noruler
  set fillchars+=vert:\ 
  set fillchars+=stl:\ 
  set fillchars+=stlnc:\ 
  set sidescroll=1
  set sidescrolloff=0

  " Hide left-hand scrollbars
  if has('gui_running')
    set guioptions-=l
    set guioptions-=L
  endif

  let t:goyo_pads.l = s:init_pad('vertical topleft new')
  let t:goyo_pads.r = s:init_pad('vertical botright new')
  let t:goyo_pads.t = s:init_pad('topleft new')
  let t:goyo_pads.b = s:init_pad('botright new')

  call s:resize_pads()
  call s:tranquilize()

  augroup goyo
    autocmd!
    autocmd TabLeave    *        call s:goyo_off()
    autocmd VimResized  *        call s:resize_pads()
    autocmd ColorScheme *        call s:tranquilize()
    autocmd BufWinEnter *        call s:hide_linenr() | call s:hide_statusline()
    autocmd WinEnter,WinLeave *  call s:hide_statusline()
    if has('nvim')
      autocmd TermClose * call feedkeys("\<plug>(goyo-resize)")
    endif
  augroup END

  call s:hide_statusline()
  if exists('g:goyo_callbacks[0]')
    call g:goyo_callbacks[0]()
  endif
  if exists('#User#GoyoEnter')
    doautocmd User GoyoEnter
  endif
endfunction

function! s:goyo_off()
  if !exists('#goyo')
    return
  endif

  " Oops, not this tab
  if !exists('t:goyo_revert')
    return
  endif

  " Clear auto commands
  augroup goyo
    autocmd!
  augroup END
  augroup! goyo
  augroup goyop
    autocmd!
  augroup END
  augroup! goyop

  for c in t:goyo_maps
    execute 'nunmap <c-w>'.escape(c, '|')
  endfor

  let goyo_revert             = t:goyo_revert
  let goyo_disabled_gitgutter = t:goyo_disabled_gitgutter
  let goyo_disabled_signify   = t:goyo_disabled_signify
  let goyo_disabled_airline   = t:goyo_disabled_airline
  let goyo_disabled_powerline = t:goyo_disabled_powerline
  let goyo_disabled_lightline = t:goyo_disabled_lightline
  let goyo_orig_buffer        = t:goyo_master
  let [line, col]             = [line('.'), col('.')]

  if tabpagenr() == 1
    tabnew
    normal! gt
    bd
  endif
  tabclose
  execute 'normal! '.s:orig_tab.'gt'
  if winbufnr(0) == goyo_orig_buffer
    " Doesn't work if window closed with `q`
    execute printf('normal! %dG%d|', line, col)
  endif

  let wmw = remove(goyo_revert, 'winminwidth')
  let ww  = remove(goyo_revert, 'winwidth')
  let &winwidth     = ww
  let &winminwidth  = wmw
  let wmh = remove(goyo_revert, 'winminheight')
  let wh  = remove(goyo_revert, 'winheight')
  let &winheight    = max([wmh, 1])
  let &winminheight = wmh
  let &winheight    = wh

  for [k, v] in items(goyo_revert)
    execute printf('let &%s = %s', k, string(v))
  endfor
  execute 'colo '. get(g:, 'colors_name', 'default')

  if goyo_disabled_gitgutter
    silent! GitGutterEnable
  endif

  if goyo_disabled_signify
    silent! if !b:sy.active
      SignifyToggle
    endif
  endif

  if goyo_disabled_airline && !exists('#airline')
    AirlineToggle
    " For some reason, Airline requires two refreshes to avoid display
    " artifacts
    silent! AirlineRefresh
    silent! AirlineRefresh
  endif

  if goyo_disabled_powerline && !exists('#PowerlineMain')
    doautocmd PowerlineStartup VimEnter
    silent! PowerlineReloadColorscheme
  endif

  if goyo_disabled_lightline
    silent! call lightline#enable()
  endif

  if exists('#Powerline')
    doautocmd Powerline ColorScheme
  endif

  if exists('g:goyo_callbacks[1]')
    call g:goyo_callbacks[1]()
  endif
  if exists('#User#GoyoLeave')
    doautocmd User GoyoLeave
  endif
endfunction

function! s:relsz(expr, limit)
  if a:expr !~ '%$'
    return str2nr(a:expr)
  endif
  return a:limit * str2nr(a:expr[:-2]) / 100
endfunction

function! s:parse_arg(arg)
  if exists('g:goyo_height') || !exists('g:goyo_margin_top') && !exists('g:goyo_margin_bottom')
    let height = s:relsz(get(g:, 'goyo_height', '85%'), &lines)
    let yoff = 0
  else
    let top = max([0, s:relsz(get(g:, 'goyo_margin_top', 4), &lines)])
    let bot = max([0, s:relsz(get(g:, 'goyo_margin_bottom', 4), &lines)])
    let height = &lines - top - bot
    let yoff = top - bot
  endif

  let dim = { 'width':  s:relsz(get(g:, 'goyo_width', 80), &columns),
            \ 'height': height,
            \ 'xoff':   0,
            \ 'yoff':   yoff }
  if empty(a:arg)
    return dim
  endif
  let parts = matchlist(a:arg, '^\s*\([0-9]\+%\?\)\?\([+-][0-9]\+%\?\)\?\%(x\([0-9]\+%\?\)\?\([+-][0-9]\+%\?\)\?\)\?\s*$')
  if empty(parts)
    echohl WarningMsg
    echo 'Invalid dimension expression: '.a:arg
    echohl None
    return {}
  endif
  if !empty(parts[1]) | let dim.width  = s:relsz(parts[1], &columns) | endif
  if !empty(parts[2]) | let dim.xoff   = s:relsz(parts[2], &columns) | endif
  if !empty(parts[3]) | let dim.height = s:relsz(parts[3], &lines)   | endif
  if !empty(parts[4]) | let dim.yoff   = s:relsz(parts[4], &lines)   | endif
  return dim
endfunction

function! goyo#execute(bang, dim)
  if a:bang
    if exists('#goyo')
      call s:goyo_off()
    endif
  else
    if exists('#goyo') == 0
      call s:goyo_on(a:dim)
    elseif !empty(a:dim)
      if winnr('$') < 5
        call s:goyo_off()
        return goyo#execute(a:bang, a:dim)
      endif
      let dim = s:parse_arg(a:dim)
      if !empty(dim)
        let t:goyo_dim = dim
        let t:goyo_dim_expr = a:dim
        call s:resize_pads()
      endif
    else
      call s:goyo_off()
    end
  end
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
