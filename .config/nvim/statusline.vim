
set laststatus=2

" Init of perso colors
" https://www.design-seeds.com/wander/sea/color-shore-25/
highlight User1 cterm=bold ctermbg=1    ctermfg=0  gui=bold guibg=#937e74
highlight User2 cterm=bold ctermbg=246  ctermfg=15 gui=bold guibg=#869e9c guifg=#937e74
highlight User3 cterm=bold ctermbg=246  ctermfg=15 gui=bold guibg=#869e9c
highlight User4 cterm=bold ctermbg=244  ctermfg=7  gui=bold guibg=#445957 guifg=#869e9c
highlight User5 cterm=bold ctermbg=244  ctermfg=15 gui=bold guibg=#445957
highlight User6 cterm=bold ctermbg=244  ctermfg=8  gui=bold guibg=#364144 guifg=#445957
highlight User7 cterm=bold ctermbg=244  ctermfg=15 gui=bold guibg=#364144
highlight User8 cterm=bold ctermbg=none ctermfg=8  gui=bold guibg=none guifg=#364144
highlight User9 cterm=bold ctermbg=none ctermfg=15 gui=bold guibg=none
" Lyrs's
"highlight User1 cterm=bold ctermbg=3 ctermfg=15 guibg=#937e74
"highlight User2 cterm=bold ctermbg=8 ctermfg=15 guibg=#575a69 guifg=#937e74
"highlight User3 cterm=bold ctermbg=8 ctermfg=15 guibg=#575a69
"highlight User4 cterm=bold ctermbg=8 ctermfg=15 guibg=#2d3144 guifg=#575a69
"highlight User5 cterm=bold ctermbg=8 ctermfg=15 guibg=#2d3144
"highlight User6 cterm=bold ctermbg=8 ctermfg=15 guibg=#191d32 guifg=#2d3144
"highlight User7 cterm=bold ctermbg=8 ctermfg=15 guibg=#191d32
"highlight User8 cterm=bold ctermbg=8 ctermfg=15 guibg=none guifg=#191d32
"highlight User9 cterm=bold ctermbg=8 ctermfg=15 guibg=none

if $TERM == "alacritty"
    let transl = ""
    let transr = ""
    let sepl = ""
    let sepr = ""
    let glyphro = ""
    let glyphff = {"dos":"", "unix":"", "mac":""}
else
    let transl = " "
    let transr = " "
    let sepl = "|"
    let sepr = "|"
    let glyphro = "RO"
    let glyphff = {"dos":"dos", "unix":"unix", "mac":"mac"}
endif

function! ActiveLine()
    let bufcount = len(getbufinfo({'buflisted':1}))

    let statusline = "%1* %w%{&modified?'+':''}%{&readonly?glyphro.' ':''}"
    let statusline.= "%2*%{transl}%3* "
    if bufcount > 1
        let statusline.= "%n/".bufcount.":"
    endif
    if strlen(bufname()) > 40
        let statusline.= "…%{strpart(bufname(), len(bufname())-40)}\ "
    else
        let statusline.= "%f\ "
    endif
    let statusline.= "%4*%{transl}"
    if &filetype!=''
        let statusline.= "%5* %{&filetype} %4*%{sepl}"
    endif
    let statusline.= "%5* %{glyphff[&ff]}"
    let statusline.= "%5* %{strlen(&fenc)?&fenc:&enc}"
    let statusline.= "%5*%{&bomb?'/BOM':''} "
    let statusline.= "%6*%{transl}%<"
    let statusline.= "%7* %{&spelllang} "
    let statusline.= "%8*%{transl}%9*%="
    let statusline.= "%8*%{transr}"
    let statusline.= "%7* L%l/%L "
    let statusline.= "%6*%{transr}"
    let statusline.= "%5* C%c%V "
    let statusline.= "%4*%{transr}"
    let statusline.= "%3* %P"
    let statusline.= "%2*%{transr}"
    let statusline.= "%1*%{&paste?'  Paste ':''}"

    return statusline
endfunction

function! InactiveLine()
    let bufcount = len(getbufinfo({'buflisted':1}))

    let statusline = "%1* %w%{&modified?'+':''}%{&readonly?glyphro.' ':''}"
    let statusline.= "%2*%{transl}%3* "
    "if bufcount > 1
    "    let statusline.= "%n/".bufcount.":"
    "endif
    if strlen(bufname()) > 40
        let statusline.= "…%{strpart(bufname(), len(bufname())-60)}\ "
    else
        let statusline.= "%f\ "
    endif
    let statusline.= "%4*%{transl}"
    "if &filetype!=''
    "    let statusline.= "%5* %{&filetype} %4*%{sepl}"
    "endif
    "let statusline.= "%5* %{glyphff[&ff]}"
    "let statusline.= "%5* %{strlen(&fenc)?&fenc:&enc}"
    "let statusline.= "%5*%{&bomb?'/BOM':''} "
    let statusline.= "%6*%{transl}%<"
    "let statusline.= "%7* %{&spelllang} "
    let statusline.= "%8*%{transl}%9*%="
    let statusline.= "%8*%{transr}"
    "let statusline.= "%7* L%l/%L "
    let statusline.= "%6*%{transr}"
    "let statusline.= "%5* C%c%V "
    let statusline.= "%4*%{transr}"
    "let statusline.= "%3* %P"
    let statusline.= "%2*%{transr}"
    let statusline.= "%1*%{&paste?'  Paste ':''}"

    return statusline
endfunction

augroup Statusline
    autocmd!
    autocmd WinEnter,BufWinEnter,FocusGained * setlocal statusline=%!ActiveLine()
    autocmd WinLeave,BufWinLeave,FocusLost * setlocal statusline=%!InactiveLine()
augroup END

