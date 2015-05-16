set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'othree/eregex.vim'
Plugin 'othree/html5.vim'
Plugin 'vim-scripts/IndentAnything'
Plugin 'vim-scripts/L9'
"Plugin 'vim-scripts/argtextobj.vim'
"Plugin 'vim-scripts/DirDiff.vim'
Plugin 'vim-scripts/django.vim'
Plugin 'vim-scripts/kwbdi.vim'
"Plugin 'vim-scripts/Highlight-UnMatched-Brackets'
Plugin 'vim-scripts/VisIncr'
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
" Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/unite-session'
"Bundle 'Shougo/vimfiler'
Plugin 'justinmk/vim-sneak'
Plugin 't9md/vim-choosewin'
Plugin 't9md/vim-quickhl'
Plugin 'derekwyatt/vim-scala'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'mhinz/vim-signify'
" Plugin 'matze/vim-move'
Plugin 'junegunn/vim-easy-align'
Plugin 'jimenezrick/vimerl'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'mkitt/tabline.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Valloric/MatchTagAlways'
Plugin 'edsono/vim-matchit'
Plugin 'sjl/gundo.vim'
Plugin 'wincent/Command-T'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'kana/vim-smartinput'
Plugin 'kana/vim-smartchr'
Plugin 'skammer/vim-css-color'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'hdima/python-syntax'
Plugin 'depuracao/vim-rdoc'
Plugin 'groenewege/vim-less'
Plugin 'rhysd/clever-f.vim'
Plugin 'chase/vim-ansible-yaml'
"Plugin 'rstacruz/sparkup'
Plugin 'bkad/CamelCaseMotion'
Plugin 'mattn/emmet-vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ajf/puppet-vim'
"Plugin 'thinca/vim-prettyprint'
Plugin 'thinca/vim-visualstar'
Plugin 'sjl/clam.vim'
Plugin 'peterhoeg/vim-tmux'
Plugin 'nono/vim-handlebars'
Plugin 'dyng/ctrlsf.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'
Plugin 'dag/vim2hs'
Plugin 'digitaltoad/vim-jade'
"Bundle 'gregsexton/gitv'

call vundle#end() 

filetype indent plugin on

set encoding=utf-8
set t_Co=256
set termencoding=utf-8
set ttyfast
set ambiwidth=double
set hidden
set nobackup
set nowritebackup
set noswapfile
set nowrap
set relativenumber
set showcmd
set cmdheight=1
set showmode
set scrolloff=3
set sidescrolloff=3
set noshowmatch
set incsearch
set wrapscan
set shiftwidth=4
set tabstop=4
set fileformat=unix
set expandtab
set autoindent
set smartindent
set noundofile
set backspace=indent,eol,start
set formatoptions=tcroqnlM1
set list
"set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
set listchars=tab:»-
set history=100
set guioptions+=lLrRbmTe
set guioptions-=lLrRbmTe
set mouse=
set vb
set mousehide
set nomousefocus
set selectmode=mouse
set mousemodel=extend
set keymodel=startsel,stopsel
set whichwrap+=<,>,[,]
set ruler
set lazyredraw
set ignorecase
set smartcase
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set key=
set virtualedit+=block
set gdefault
set sessionoptions=blank,buffers,curdir,folds,globals,localoptions,options,resize,tabpages,winsize
set shellslash

if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

if has("gui_macvim")
    let macvim_skip_cmd_opt_movement=1
    set transparency=0
endif

if has("gui_running")
    set cursorline
    set background=light
    colorscheme solarized
    set guifont=Monaco:h14
endif

function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return ""
    endif
    if bytes < 1024
        return bytes . "b"
    else
        return (bytes/1024) . "k"
    endif
endfunction

set laststatus=2

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

"This autocommand jumps to the last known position in a file
"just after opening it, if the '" mark is set: >
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

"respective filetype settings
autocmd FileType javascript,ruby,yaml setlocal tabstop=2 | setlocal shiftwidth=2
autocmd BufNewFile,BufRead *.dtl set filetype=htmldjango
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

""""""""""""""""""""""""""""""""""""""""""""""""""
"=> key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=','
let maplocalleader=','

map <F1> <Esc>
map! <F1> <Esc>

vnoremap <C-C> "+y
map <C-V> "+gP
cmap <C-V> <C-R>+
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

"Fast editing of the .vimrc file
noremap <leader>rc :tabe $MYVIMRC<CR>

map Q gq

map <Up> k
map <Down> j
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

nnoremap K <Nop>

imap <C-f> <Right>
imap <C-b> <Left>

map <S-CR> O<ESC>
map <CR> o<ESC>
autocmd FileType qf noremap <buffer> <CR> <CR>

"open quickfix window
nnoremap <Leader>co :<C-u>copen<CR>

"toggle line-wrap
nnoremap <Space>wr :set wrap!<CR>

"manipulating windows
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l
nnoremap <S-Up> <C-w>+
nnoremap <S-Down> <C-w>-
nnoremap <Space>cc :clo<CR>
nnoremap <Space>cj <C-w>j:clo<CR>
nnoremap <Space>ck <C-w>k:clo<CR>
nnoremap <Space>ch <C-w>h:clo<CR>
nnoremap <Space>cl <C-w>l:clo<CR>
nnoremap <Space>wo :only<CR>
nnoremap <Space>to :tabonly<CR>

"scorlling up or down page
noremap <D-j> <C-f>
noremap <D-k> <C-b>

"replace line
nnoremap cp Pjdd

"moving tabages
nmap <Tab> gT
nmap \ gt
if has('mac')
    nnoremap <silent> <expr> <D-Left> ':exec "tabm ' . string(tabpagenr() - 2 < 0 ? tabpagenr("$") : tabpagenr() - 2) . '"<CR>'
    nnoremap <silent> <expr> <D-Right> ':exec "tabm ' . string(tabpagenr() + 1) . '"<CR>'
else
    nnoremap <silent> <expr> <C-Left> ':exec "tabm ' . string(tabpagenr() - 2 < 0 ? tabpagenr("$") : tabpagenr() - 2) . '"<CR>'
    nnoremap <silent> <expr> <C-Right> ':exec "tabm ' . string(tabpagenr() + 1) . '"<CR>'
endif

"switching between alternative buffers
"nnoremap \ :b#<CR>

"toggle tabline
nnoremap <F11> :let &showtabline = &showtabline == 1 ? 0 : 1<CR>

cmap "" ""<LEFT>
cmap '' ''<LEFT>
cmap <> <><LEFT>
cmap () ()<LEFT>
cmap {} {}<LEFT>
cmap [] []<LEFT>

vnoremap > >gv
vnoremap < <gv

nnoremap <Left> <<
nnoremap <Right> >>

noremap <Leader>no :se nolist<CR>

"cancel search highlight
nnoremap <leader><CR> :noh<CR>

"to line start and end
nnoremap gh ^
vnoremap gh ^
nnoremap gl $
vnoremap gl $

noremap ; :
noremap : ;

"auto escape / and ? while searching 
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

"quick search
nnoremap // /^
nnoremap <Space>/ /\<\><left><left>

"makes ctrl-u undoable
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

"subsititute the word under cursor in the current buffers
" nnoremap <expr> s* ':%s/\<'.expand('<cword>').'\>/'

"Yank from the cursor to the end of the line
nnoremap Y y$

"repeat last command
nnoremap c. q:k<CR>

"search within selected area
vnoremap z/ <ESC>/\%V
vnoremap z? <ESC>?\%V

" back to normal mode from insert mode
imap jj <ESC>

"toggle fold
nnoremap <space>a za

"clost tab
nnoremap <Leader>tc :tabc<CR>

nnoremap <D-1> 1gt
nnoremap <D-2> 2gt
nnoremap <D-3> 3gt
nnoremap <D-4> 4gt
nnoremap <D-5> 5gt
nnoremap <D-6> 6gt
nnoremap <D-7> 7gt
nnoremap <D-8> 8gt
nnoremap <D-9> 9gt

"expand path on command-line
cmap <C-x> <C-r>=expand('%:p:h')<CR>/
cmap <C-z> <C-r>=expand('%:p')<CR>

"display the syntax higlighting group which the word under the cursor belongs to
nnoremap <silent> <Leader>hl :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
     \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
     \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
     \ . ">"<CR>

vnoremap p :<C-u>call <SID>yank_paste_without_yanking()<CR>
function! s:yank_paste_without_yanking()
    let a = @"
    normal! gvp
    let @" = a
endfunction

"maximize current window, and press <c-w>= to restore original sizes
"vim-users hack#106
command! Big wincmd _ | wincmd |
nnoremap <Space>wb :Big<CR>

"easy splitting windows. vim-hack#159
nmap <Space>sj <SID>(split-to-j)
nmap <Space>sk <SID>(split-to-k)
nmap <Space>sh <SID>(split-to-h)
nmap <Space>sl <SID>(split-to-l)

nnoremap <SID>(split-to-j) :<C-u>execute 'belowright' (v:count == 0 ? '':v:count) 'split'<CR>
nnoremap <SID>(split-to-k) :<C-u>execute 'aboveleft' (v:count == 0 ? '':v:count) 'split'<CR>
nnoremap <SID>(split-to-h) :<C-u>execute 'topleft' (v:count == 0 ? '':v:count) 'vsplit'<CR>
nnoremap <SID>(split-to-l) :<C-u>execute 'botright' (v:count == 0 ? '':v:count) 'vsplit'<CR>

"swap windows gist:654701 by tyru
nmap <Space>wj <SID>(swap-window-down-no-cursor-move)
nmap <Space>wk <SID>(swap-window-up-no-cursor-move)
nmap <Space>wh <SID>(swap-window-left-no-cursor-move)
nmap <Space>wl <SID>(swap-window-right-no-cursor-move)

nnoremap <SID>(swap-window-down-no-cursor-move) :<C-u>call <SID>swap_with_wincmd(v:count1, 'j')<CR>
nnoremap <SID>(swap-window-up-no-cursor-move) :<C-u>call <SID>swap_with_wincmd(v:count1, 'k')<CR>
nnoremap <SID>(swap-window-left-no-cursor-move) :<C-u>call <SID>swap_with_wincmd(v:count1, 'h')<CR>
nnoremap <SID>(swap-window-right-no-cursor-move) :<C-u>call <SID>swap_with_wincmd(v:count1, 'l')<CR>

function! s:swap_with_wincmd(n, dir)
    let curwin = winnr()
    execute a:n 'wincmd' a:dir
    let targetwin = winnr()
    wincmd p
    call s:swap_window(curwin, targetwin)
endfunction

function! s:swap_window(curwin, targetwin)
    let curbuf = winbufnr(a:curwin)
    let targetbuf = winbufnr(a:targetwin)
    if curbuf == targetbuf
        " TODO: Swap also same buffers
    else
        execute 'hide' targetbuf . 'buffer'
        execute a:targetwin 'wincmd w'
        execute curbuf 'buffer'
        "wincmd p "Behave like <C-w>x ?
    endif
endfunction

"center the matching line when searching
noremap N Nzz
noremap n nzz

"DiffOrig
nnoremap <Leader>do :DiffOrig<CR>

" kana's useful tab function modified by stwind {{{
function! s:move_window_into_tab_page(target_tabpagenr)
  " Move the current window into a:target_tabpagenr.
  " If a:target_tabpagenr is 0, move into new tab page.
  if a:target_tabpagenr < 0  " ignore invalid number.
    return
  endif
  let original_tabnr = tabpagenr()
  let target_bufnr = bufnr('')
  let window_view = winsaveview()

  if a:target_tabpagenr == 0
    tabnew
    setlocal buftype=nofile
    setlocal bufhidden=unload
    execute target_bufnr 'buffer'
    let target_tabpagenr = tabpagenr()
  else
    execute a:target_tabpagenr 'tabnext'
    let target_tabpagenr = a:target_tabpagenr
    topleft new  " FIXME: be customizable?
    execute target_bufnr 'buffer'
  endif
  call winrestview(window_view)

  execute original_tabnr 'tabnext'
  close

  execute target_tabpagenr 'tabnext'
endfunction " }}}

" <space>ao move current buffer into a new tab.
nnoremap <silent> <leader>ao :<C-u>call <SID>move_window_into_tab_page(0)<Cr>

"Change current directory by one command.
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif
    if a:bang == ''
        pwd
    endif
endfunction

nnoremap <silent> <leader>cd :<C-u>CD<CR>

command! -nargs=0 Amp execute 'normal!' printf('/\<%s\><Cr>', expand('<cword>'))
nnoremap & :Amp<Cr>

function! s:HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
endfunction
function! s:HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction
vnoremap <silent> <space>e :call <SID>HtmlEscape()<CR>
vnoremap <silent> <space>ue :call <SID>HtmlUnEscape()<CR>

command! W w !sudo tee % > /dev/null

"function! JISX0208SpaceHilight()
    "syntax match JISX0208Space "　" display containedin=ALL
    "hi JISX0208Space cterm=NONE ctermfg=148 ctermbg=236 gui=#002b36 guifg=#afd700 guibg=#303030
"endf

"if has("syntax")
    "syntax on
        "augroup invisible
        "autocmd! invisible
        "autocmd BufNew,BufRead * call JISX0208SpaceHilight()
    "augroup END
"endif

"--------------------------------------------------
"NERDTree
"--------------------------------------------------
nnoremap <silent> <F5> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>nt :NERDTree<CR>
nnoremap <silent> <Leader>nf :NERDTreeFind<CR>
let NERDTreeWinPos = "right"
let NERDTreeMinimalUI = 1
let NERDTreeWinSize = 38
let NERDTreeIgnore=['\.beam$', '\.pyc$']

"--------------------------------------------------
"vim-commentary
"--------------------------------------------------
nmap <Leader>c<Space> gcc
vmap <Leader>c<Space> gc
autocmd FileType cfg set commentstring=#\ %s

"--------------------------------------------------
"Gundo
"--------------------------------------------------
nnoremap <silent> <F4> :GundoToggle<CR>
let g:gundo_preview_bottom = 1
let g:gundo_right = 1

"--------------------------------------------------
"Powerline
"--------------------------------------------------
let g:Powerline_symbols='fancy'

"--------------------------------------------------
"Airline
"--------------------------------------------------
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
"--------------------------------------------------
"Powerline
"--------------------------------------------------
let g:sneak#s_next = 1
"--------------------------------------------------
"clam.vim
"--------------------------------------------------
nnoremap ! :Clam<space>

"--------------------------------------------------
"Unite
"--------------------------------------------------
let g:unite_source_file_mru_limit = 300
let g:unite_source_file_mru_time_format= ''
let g:unite_source_file_mru_filename_format = ':.'
let g:unite_source_directory_mru_limit = 200
let g:unite_source_directory_mru_time_format = ''
let g:unite_enable_start_insert = 1
let g:unite_session_path = '$VIM/_sessions'

nnoremap <leader>be :<C-u>Unite -buffer-name=buf -no-start-insert -ignorecase buffer<CR>
nnoremap <leader>bs :<C-u>Unite -buffer-name=buf -horizontal -ignorecase -default-action=above -no-start-insert buffer<CR>
nnoremap <leader>bv :<C-u>Unite -buffer-name=buf -vertical -ignorecase -default-action=left -no-start-insert buffer<CR>
nnoremap <leader>ur :<C-u>Unite -buffer-name=mru -vertical -ignorecase file_mru<CR>
nnoremap <leader>ud :<C-u>Unite -buffer-name=dir -vertical -ignorecase -default-action=cd directory_mru<CR>
nnoremap <leader>up :<C-u>Unite -buffer-name=regs -no-start-insert register<CR>
nnoremap <Leader>uc :<C-u>Unite -buffer-name=files file_rec<CR>
nnoremap <Leader>uf :<C-u>Unite -buffer-name=files file<CR>
nnoremap <leader>ux :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <leader>uo :<C-u>Unite -buffer-name=outline -vertical -winwidth=50 -no-quit -no-start-insert outline<CR>
nnoremap <leader>ul :<C-u>Unite -buffer-name=line -vertical line<CR>

autocmd Filetype unite nnoremap <silent> <buffer> <expr> s unite#do_action('split')
autocmd Filetype unite nnoremap <silent> <buffer> <expr> v unite#do_action('vsplit')
autocmd Filetype unite nnoremap <silent> <buffer> <expr> t unite#do_action('tabopen')
autocmd Filetype unite inoremap <silent> <buffer> jj <ESC>0

"call unite#set_buffer_name_option('files', 'smartcase', '0')

call unite#custom#profile('files', 'substitute_patterns', {
            \ 'pattern' : '^.\+[^~.*]*',
            \ 'subst' : '*\0*',
            \ 'priority' : 100,
            \ })
" call unite#custom#profile('files', 'ignorecase', 1)

"--------------------------------------------------
"eregex.vim
"--------------------------------------------------
nnoremap <leader>/ :M/
nnoremap <leader>? :M?
let g:eregex_default_enable = 0

"--------------------------------------------------
"smartchr
"--------------------------------------------------
inoremap <expr> - smartchr#loop('-', '->', '--')

"--------------------------------------------------
"quickhl.vim
"--------------------------------------------------
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
"--------------------------------------------------
"vim-signify
"--------------------------------------------------
nmap <Space>gj <plug>(signify-next-hunk)
nmap <Space>gk <plug>(signify-prev-hunk)
"--------------------------------------------------
"sparkup
"--------------------------------------------------
"let g:sparkup = '~/.vim/bundle/sparkup/vim/ftplugin/html/sparkup.py'
"autocmd FileType html,xhtml,xml,xaml source ~/.vim/bundle/sparkup/vim/ftplugin/html/sparkup.vim

"--------------------------------------------------
"fugitive.vim
"--------------------------------------------------
nnoremap <Leader>gs :Gstatus<CR>

"--------------------------------------------------
"EasyAlign
"--------------------------------------------------
vmap <Enter> <Plug>(EasyAlign)
"--------------------------------------------------
"Comman-T
"--------------------------------------------------
nnoremap <Leader>t :CommandT<CR>
nnoremap <D-t> :CommandT<CR>
let g:CommandTMatchWindowAtTop = 1
set wildignore+=*.o,*.obj,*.git,*.beam,*.pyc,*.class

"--------------------------------------------------
"surround.vim
"--------------------------------------------------
"autocmd VimEnter * xunmap s

"--------------------------------------------------
"syntastic
"--------------------------------------------------
let g:syntastic_enable_balloons = 0
let g:syntastic_erlang_checkers = ['syntaxerl']
let g:syntastic_ignore_files = ['.*\.scala$', '.*\.sbt$']

"--------------------------------------------------
"zencoding
"--------------------------------------------------
"let g:user_zen_leader_key = '<D-y>'

"--------------------------------------------------
"solarized
"--------------------------------------------------
let g:solarized_contrast = "high"
let g:solarized_visibility = "high"

"--------------------------------------------------
"easymotion
"--------------------------------------------------
let g:EasyMotion_leader_key = '<space>'

"--------------------------------------------------
"base16
"--------------------------------------------------
let base16colorspace=256
"--------------------------------------------------
"tagbar
"--------------------------------------------------
nnoremap <F8> :TagbarToggle<CR>
"--------------------------------------------------
"CtrlSF
"--------------------------------------------------
let g:ctrlsf_ackprg = 'ag'
"--------------------------------------------------
"vim-move
"--------------------------------------------------
let g:move_key_modifier = 'A'
"--------------------------------------------------
"choosewin
"--------------------------------------------------
let g:choosewin_overlay_enable = 1
nmap  -  <Plug>(choosewin)
"--------------------------------------------------
"neocomplete
"--------------------------------------------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#max_list = 20
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" if !exists('g:neocomplcache_keyword_patterns')
"     let g:neocomplcache_keyword_patterns = {}
" endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

if !has("mac")
    let g:neocomplcache_enable_auto_select = 1
endif

inoremap <expr> <C-h> neocomplete#smart_close_popup().'\<C-h>'
inoremap <expr> <Tab> pumvisible() ? '\<C-n>' : '<Tab>'
inoremap <expr> <C-Y> neocomplete#cancel_popup()
inoremap <expr> <CR> pumvisible() ? neocomplete#close_popup() : '<CR>'

inoremap <expr> <C-l> neocomplete#complete_common_string()
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

" if has('conceal')
"   set conceallevel=2 concealcursor=i
" endif

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,xhtml,xml,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"Align
let g:Align_xstrlen=2

"vimerl
let erlang_show_errors = 0

"python-syntax
let python_highlight_all = 1

"language
set langmenu=en_US
let $LANG='en_US'
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

" FIX: PluginUpdate => git pull: git-sh-setup: No such file or directory in MacVim (OK in non-GUI version of Vim)
if has("gui_macvim")
    set shell=/bin/bash\ -l
endif
