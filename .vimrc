set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle "gmarik/vundle"
Bundle "tpope/vim-fugitive"
Bundle "altercation/vim-colors-solarized"
Bundle "jpo/vim-railscasts-theme"
Bundle "othree/eregex.vim"
Bundle "othree/html5.vim"
Bundle "vim-scripts/IndentAnything"
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/nerdcommenter"
Bundle "scrooloose/syntastic"
Bundle "Shougo/neocomplcache"
Bundle "Shougo/neocomplcache-snippets-complete"
Bundle "Shougo/unite.vim"
Bundle "Shougo/vimproc"
Bundle "h1mesuke/unite-outline"
Bundle "h1mesuke/vim-alignta"
"Bundle "tsaleh/vim-align"
Bundle "oscarh/vimerl"
Bundle "pangloss/vim-javascript"
Bundle "vim-scripts/L9"
Bundle "edsono/vim-matchit"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-surround"
Bundle "sjl/gundo.vim"
Bundle "wincent/Command-T"
Bundle "hail2u/vim-css3-syntax"
Bundle "kana/vim-smartinput"
Bundle "skammer/vim-css-color"
Bundle "kchmck/vim-coffee-script"
Bundle "vim-ruby/vim-ruby"
Bundle "me-vlad/python-syntax.vim"
Bundle "depuracao/vim-rdoc"
Bundle "groenewege/vim-less"
"Bundle "rstacruz/sparkup"
Bundle "bkad/CamelCaseMotion"
Bundle "mattn/zencoding-vim"
"Bundle "vim-scripts/argtextobj.vim"
Bundle "michaeljsmith/vim-indent-object"
Bundle "t9md/vim-quickhl"
"Bundle "vim-scripts/DirDiff.vim"
Bundle "vim-scripts/django.vim"
Bundle "Lokaltog/vim-powerline"
Bundle "Lokaltog/vim-easymotion"
Bundle "vim-scripts/kwbdi.vim"
Bundle "ajf/puppet-vim"
"Bundle "vim-scripts/Highlight-UnMatched-Brackets"
"Bundle "thinca/vim-prettyprint"
Bundle "thinca/vim-visualstar"
Bundle "sjl/clam.vim"
"Bundle "gregsexton/gitv"

filetype indent plugin on

let s:iswin = has("win32") || has("wind64")

set encoding=utf-8
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

let &statusline = ''
let &statusline .= '[#%n]'
let &statusline .= '%y[%{&l:fileencoding == "" ? &encoding : &l:fileencoding}:%{&fileformat}] '
let &statusline .= '%t%{strlen(expand("%:h")) ? " (" . expand("%:h") . ") " : ""}'
let &statusline .= '%m%r '
let &statusline .= 'Line:%l/%L[%p%%] '
let &statusline .= 'Col:%c [%b][0x%B]'
let &statusline .= '%='
let &statusline .= '%{SyntasticStatuslineFlag()} '
let &statusline .= '%{FileSize()}'
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
autocmd FileType javascript setlocal tabstop=2 | setlocal shiftwidth=2
autocmd BufNewFile,BufRead *.dtl set filetype=htmldjango

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
    nnoremap <silent> <expr> <D-Right> ':exec "tabm ' . string(tabpagenr()) . '"<CR>'
else
    nnoremap <silent> <expr> <C-Left> ':exec "tabm ' . string(tabpagenr() - 2 < 0 ? tabpagenr("$") : tabpagenr() - 2) . '"<CR>'
    nnoremap <silent> <expr> <C-Right> ':exec "tabm ' . string(tabpagenr()) . '"<CR>'
endif

"switching between alternative buffers
"nnoremap \ :b#<CR>

"toggle tabline
nnoremap <F11> :let &showtabline = &showtabline == 1 ? 0 : 1<CR>

"imap "" ""<LEFT>
"imap '' ''<LEFT>
"imap <> <><LEFT>
"imap () ()<LEFT>
"imap {} {}<LEFT>
"imap [] []<LEFT>
cmap "" ""<LEFT>
cmap '' ''<LEFT>
cmap <> <><LEFT>
cmap () ()<LEFT>
cmap {} {}<LEFT>
cmap [] []<LEFT>

"easily moving lines up and down
vnoremap <C-S-Up> :move -2<CR>gv
vnoremap <C-S-Down> :move '>+<CR>gv

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
nnoremap // /^[\s\t]*
nnoremap <Space>/ /\<\><left><left>

"makes ctrl-u undoable
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

"subsititute the word under cursor in the current buffers
nnoremap <expr> s* ':%s/\<'.expand('<cword>').'\>/'

"Yank from the cursor to the end of the line
nnoremap Y y$

"repeat last command
nnoremap c. q:k<CR>

"search within selected area
vnoremap z/ <ESC>/\%V
vnoremap z? <ESC>?\%V

"back to normal mode from insert mode
imap jj <ESC>

"toggle fold
nnoremap <space>a za

"clost tab
nnoremap <Leader>tc :tabc<CR>

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

"--------------------------------------------------
"NerdCommenter
"--------------------------------------------------
"comment style for F#
let g:NERDCustomDelimiters = {
    \   'fs': { 'left' : '//' },
    \   'fsharp': { 'left' : '//' } 
    \ }

"--------------------------------------------------
"Gundo
"--------------------------------------------------
nnoremap <silent> <F4> :GundoToggle<CR>
let g:gundo_preview_bottom = 1
let g:gundo_right = 1

"--------------------------------------------------
"Gundo
"--------------------------------------------------
let g:Powerline_symbols='fancy'

"--------------------------------------------------
"clam.vim
"--------------------------------------------------
nnoremap ! :Clam<space>

"--------------------------------------------------
"Unite
"--------------------------------------------------
let g:unite_source_file_mru_limit = 200
let g:unite_source_file_mru_time_format= ''
let g:unite_source_file_mru_filename_format = ':.'
let g:unite_source_directory_mru_limit = 200
let g:unite_source_directory_mru_time_format = ''
let g:unite_enable_start_insert = 1
let g:unite_session_path = '$VIM/_sessions'

nnoremap <leader>be :<C-u>Unite -buffer-name=buf -no-start-insert buffer<CR>
nnoremap <leader>bs :<C-u>Unite -buffer-name=buf -horizontal -default-action=above -no-start-insert buffer<CR>
nnoremap <leader>bv :<C-u>Unite -buffer-name=buf -vertical -default-action=left -no-start-insert buffer<CR>
nnoremap <leader>ur :<C-u>Unite -buffer-name=mru -vertical file_mru<CR>
nnoremap <leader>ud :<C-u>Unite -buffer-name=dir -vertical -default-action=cd directory_mru<CR>
nnoremap <leader>up :<C-u>Unite -buffer-name=regs -no-start-insert register<CR>
nnoremap <Leader>uc :<C-u>Unite -buffer-name=files file_rec<CR>
nnoremap <Leader>uf :<C-u>Unite -buffer-name=files file<CR>
nnoremap <leader>ux :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <leader>uo :<C-u>Unite -buffer-name=outline -vertical -winwidth=50 -no-quit -no-start-insert outline<CR>
nnoremap <leader>uh :<C-u>Unite -buffer-name=history -vertical -winwidth=35 history/command<CR>
nnoremap <leader>ul :<C-u>Unite -buffer-name=line -vertical line<CR>

autocmd Filetype unite nnoremap <silent> <buffer> <expr> s unite#do_action('split')
autocmd Filetype unite nnoremap <silent> <buffer> <expr> v unite#do_action('vsplit')
autocmd Filetype unite nnoremap <silent> <buffer> <expr> t unite#do_action('tabopen')
autocmd Filetype unite inoremap <silent> <buffer> jj <ESC>0

call unite#set_substitute_pattern('files', '^.\+[^~.*]*', '*\0*', 100)
call unite#set_buffer_name_option('files', 'ignorecase', '1')
call unite#set_buffer_name_option('files', 'smartcase', '0')

"--------------------------------------------------
"eregex.vim
"--------------------------------------------------
nnoremap <leader>/ :M/
nnoremap <leader>? :M?

"--------------------------------------------------
"quickhl.vim
"--------------------------------------------------
nmap <Space>m <Plug>(quickhl-toggle)
xmap <Space>m <Plug>(quickhl-toggle)
nmap <Space>M <Plug>(quickhl-reset)
xmap <Space>M <Plug>(quickhl-reset)

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
"Comman-T
"--------------------------------------------------
nnoremap <Leader>t :CommandT<CR>
nnoremap <D-t> :CommandT<CR>
let g:CommandTMatchWindowAtTop = 1
set wildignore+=*.o,*.obj,*.git,*.beam

"--------------------------------------------------
"surround.vim
"--------------------------------------------------
"autocmd VimEnter * xunmap s

"--------------------------------------------------
"syntastic
"--------------------------------------------------
let g:syntastic_enable_balloons = 0

"--------------------------------------------------
"zencoding
"--------------------------------------------------
let g:user_zen_leader_key = '<D-y>'

"--------------------------------------------------
"easymotion
"--------------------------------------------------
let g:EasyMotion_leader_key = '<space>'

"--------------------------------------------------
"neocomplcache
"--------------------------------------------------
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_underbar_completion = 0
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_wildcard = 0
let g:neocomplcache_manual_completion_start_length = 0

if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif

if !has("mac")
    let g:neocomplcache_enable_auto_select = 1
endif

inoremap <expr> <C-h> neocomplcache#smart_close_popup().'\<C-h>'
inoremap <expr> <Tab> pumvisible() ? '\<C-n>' : '<Tab>'
inoremap <expr> <C-Y> neocomplcache#cancel_popup()
inoremap <expr> <CR> pumvisible() ? neocomplcache#close_popup() : '<CR>'

"inoremap <expr> <C-d> neocomplcache#undo_completion()
inoremap <expr> <C-l> neocomplcache#complete_common_string()
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,xhtml,xml,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"Align
let g:Align_xstrlen=2

"language
set langmenu=en_US
let $LANG='en_US'
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

""""""""""""""""""""""""""""""""""""""""""""""""
"=> tabline settings
""""""""""""""""""""""""""""""""""""""""""""""""""
set tabline=%!SetTabLine()

function! SetTabLine()
    " NOTE: left/right padding of each tab was hard coded as 1 space.
    " NOTE: require Vim 7.3 strwidth() to display fullwidth text correctly.

    " settings
    let tabMinWidth = 0
    let tabMaxWidth = 40
    let tabMinWidthResized = 15
    let tabScrollOff = 5
    let tabEllipsis = '…'
    let tabDivideEquel = 0

    let s:tabLineTabs = []

    let tabCount = tabpagenr('$')
    let tabSel = tabpagenr()

    " fill s:tabLineTabs with {n, filename, split, flag} for each tab
    for i in range(tabCount)
        let tabnr = i + 1
        let buflist = tabpagebuflist(tabnr)
        let winnr = tabpagewinnr(tabnr)
        let bufnr = buflist[winnr - 1]

        let filename = bufname(bufnr)
        let filename = fnamemodify(filename, ':p:t')
        let buftype = getbufvar(bufnr, '&buftype')
        if filename == ''
            if buftype == 'nofile'
                let filename .= '[Scratch]'
            else
                let filename .= '[New]'
            endif
        endif
        let split = ''
        let winCount = tabpagewinnr(tabnr, '$')
        if winCount > 1 " has split windows
            let split .= winCount
        endif
        let flag = ''
        if getbufvar(bufnr, '&modified') " modified
            let flag .= '+'
        endif
        if strlen(flag) > 0 || strlen(split) > 0
            let flag .= ' '
        endif

        call add(s:tabLineTabs, {'n': tabnr, 'split': split, 'flag': flag, 'filename': filename})
    endfor

    " variables for final oupout
    let s = ''
    let l:tabLineTabs = deepcopy(s:tabLineTabs)

    " overflow adjustment
    " 1. apply min/max tabWidth option
    if s:TabLineTotalLength(l:tabLineTabs) > &columns
        unlet i
        for i in l:tabLineTabs
            let tabLength = s:CalcTabLength(i)
            if tabLength < tabMinWidth
                let i.filename .= repeat(' ', tabMinWidth - tabLength)
            elseif tabMaxWidth > 0 && tabLength > tabMaxWidth
                let reserve = tabLength - strwidth(i.filename) + strwidth(tabEllipsis)
                if tabMaxWidth > reserve
                    let i.filename = StrCrop(i.filename, (tabMaxWidth - reserve), '~') . tabEllipsis
                endif
            endif
        endfor
    endif
    " 2. try divide each tab equal-width
    if tabDivideEquel
        if s:TabLineTotalLength(l:tabLineTabs) > &columns
            let divideWidth = max([tabMinWidth, tabMinWidthResized, &columns / tabCount, strwidth(tabEllipsis)])
            unlet i
            for i in l:tabLineTabs
                let tabLength = s:CalcTabLength(i)
                if tabLength > divideWidth
                    let i.filename = StrCrop(i.filename, divideWidth - strwidth(tabEllipsis), '~') . tabEllipsis
                endif
            endfor
        endif
    endif
    " 3. ensure visibility of current tab
    let rhWidth = 0
    let t = tabCount - 1
    let rhTabStart = min([tabSel - 1, tabSel - tabScrollOff])
    while t >= max([rhTabStart, 0])
        let tab = l:tabLineTabs[t]
        let tabLength = s:CalcTabLength(tab)
        let rhWidth += tabLength
        let t -= 1
    endwhile
    while rhWidth >= &columns
        let tab = l:tabLineTabs[-1]
        let tabLength = s:CalcTabLength(tab)
        let lastTabSpace = &columns - (rhWidth - tabLength)
        let rhWidth -= tabLength
        if rhWidth > &columns
            call remove(l:tabLineTabs, -1)
        else
            " add special flag (will be removed later) indicating that how many
            " columns could be used for last displayed tab.
            if tabSel <= tabScrollOff || tabSel < tabCount - tabScrollOff
                let tab.flag .= '>' . lastTabSpace
            endif
        endif
    endwhile

    " final ouput
    unlet i
    for i in l:tabLineTabs
        let tabnr = i.n

        let split = ''
        if strlen(i.split) > 0
            if tabnr == tabSel
                let split = '%#TitleCust#' . i.split .'%#TabLineSelCust#'
            else
                let split = '%#TabLine#' . i.split .'%#TabLine#'
            endif
        endif

        let text = ' ' . split . i.flag . i.filename . ' '

        if i.n == l:tabLineTabs[-1].n
            if match(i.flag, '>\d\+') > -1 || i.n < tabCount
                let lastTabSpace = matchstr(i.flag, '>\zs\d\+')
                let i.flag = substitute(i.flag, '>\d\+', '', '')
                if lastTabSpace <= strlen(i.n)
                    if lastTabSpace == 0
                        let s = strpart(s, 0, strlen(s) - 1)
                    endif
                    let s .= '%#TabLineMore#>'
                    continue
                else
                    let text = ' ' . i.split . i.flag . i.filename . ' '
                    let text = StrCrop(text, (lastTabSpace - strlen(i.n) - 1), '~') . '%#TabLineMore#>'
                    let text = substitute(text, ' ' . i.split, ' ' . split, '')
                endif
            endif
        endif

        let s .= '%' . tabnr . 'T' " start of tab N

        if tabnr == tabSel
            let s .= '%#IdentifierCust#(' . tabnr . ')%#TabLineSelCust#'
        else
            let s .= '%#TabLine#(' . tabnr . ')%#TabLine#'
        endif

        let s .= text

    endfor

    let s .= '%#TabLineFill#%T'
    return s
endf

function! s:CalcTabLength(tab)
    return strlen(a:tab.n) + 2 + strlen(a:tab.split) + strlen(a:tab.flag) + strwidth(a:tab.filename)
endf

function! s:TabLineTotalLength(dict)
    let length = 0
    for i in (a:dict)
        let length += strlen(i.n) + 2 + strlen(i.split) + strlen(i.flag) + strwidth(i.filename)
    endfor
    return length
endf

" }}}2 依字串長度（column 數）裁切多餘文字 {{{2
function! StrCrop(str, len, ...)
    let l:padChar = a:0 > 0 ? a:1 : ' '
    let text = substitute(a:str, '\%>' . a:len . 'c.*', '', '')
    let remainChars = split(substitute(a:str, text, '', ''), '\zs')
    while strwidth(text) < a:len
        let longer = len(remainChars) > 0 ? (text . remove(remainChars, 0)) : text
        if strwidth(longer) < a:len
            let text = longer
        else
            let text .= l:padChar
        endif
    endwhile
    return text
endf

hi TabLineSelCust ctermfg=235 guifg=#073642 ctermbg=239 guibg=NONE cterm=NONE gui=underline term=NONE
hi TabLineCust ctermfg=244 guifg=#839496 ctermbg=235 guibg=NONE cterm=NONE gui=underline term=NONE
hi IdentifierCust ctermfg=4 guifg=#268bd2 ctermbg=NONE guibg=NONE cterm=NONE gui=underline term=NONE
hi TitleCust ctermfg=166 guifg=#cb4b16 ctermbg=NONE guibg=NONE cterm=NONE gui=underline term=NONE
hi TabLineMore cterm=underline ctermfg=White ctermbg=236 gui=underline guifg=White guibg=#303030
hi TabLineSplitNr cterm=underline ctermfg=148 ctermbg=240 gui=underline,italic guifg=#afd700 guibg=#6c6c6c
hi TabLineSplitNrSel cterm=NONE ctermfg=148 ctermbg=236 gui=NONE,italic guifg=#afd700 guibg=#303030
