set background=dark

colorscheme solarized
" colorscheme base16-paraiso
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
" set guifont=Droid\ Sans\ Mono\ Slashed\ For\ Powerline:h12
" set guifont=Meslo\ for\ Powerline:h13
set linespace=0

set visualbell

set fuopt+=maxhorz
set fuopt+=maxvert
" set fu

set cmdheight=1

if has("mac")
    macm File.New\ Window key=<nop>
    macm File.New\ Tab key=<nop>
    macm File.Print key=<nop>
    macm Tools.List\ Errors key=<nop>
    macm Edit.Find.Find\.\.\. key=<nop>
endif
