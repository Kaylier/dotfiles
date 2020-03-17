
set laststatus=2

" Init of perso colors
" https://www.design-seeds.com/wander/sea/color-shore-25/
if $COLOR0_LIGHT  == "" | let $COLOR0_LIGHT  = "#a0a0a0" | endif
if $COLOR0_MEDIUM == "" | let $COLOR0_MEDIUM = "#808080" | endif
if $COLOR0_DARK   == "" | let $COLOR0_DARK   = "#606060" | endif
if $COLOR1_LIGHT  == "" | let $COLOR1_LIGHT  = "#a0a0c0" | endif
if $COLOR1_MEDIUM == "" | let $COLOR1_MEDIUM = "#8080a0" | endif
if $COLOR1_DARK   == "" | let $COLOR1_DARK   = "#606080" | endif
if $COLOR_ROOT    == "" | let $COLOR_ROOT    = "#ffff00" | endif
if $COLOR_ERROR   == "" | let $COLOR_ERROR   = "#ff0000" | endif
if $COLOR_WARNING == "" | let $COLOR_WARNING = "#ff7f00" | endif
execute 'highlight User1 cterm=bold ctermbg=1    ctermfg=0  gui=bold guibg='.$COLOR1_LIGHT
execute 'highlight User2 cterm=bold ctermbg=246  ctermfg=15 gui=bold guibg='.$COLOR0_LIGHT.' guifg='.$COLOR1_LIGHT
execute 'highlight User3 cterm=bold ctermbg=246  ctermfg=15 gui=bold guibg='.$COLOR0_LIGHT
execute 'highlight User4 cterm=bold ctermbg=244  ctermfg=7  gui=bold guibg='.$COLOR0_MEDIUM.' guifg='.$COLOR0_LIGHT
execute 'highlight User5 cterm=bold ctermbg=244  ctermfg=15 gui=bold guibg='.$COLOR0_MEDIUM
execute 'highlight User6 cterm=bold ctermbg=244  ctermfg=8  gui=bold guibg='.$COLOR0_DARK.' guifg='.$COLOR0_MEDIUM
execute 'highlight User7 cterm=bold ctermbg=244  ctermfg=15 gui=bold guibg='.$COLOR0_DARK
execute 'highlight User8 cterm=bold ctermbg=none ctermfg=8  gui=bold guibg=none guifg='.$COLOR0_DARK
execute 'highlight User9 cterm=bold ctermbg=none ctermfg=8  gui=bold guibg=none guifg=none'

if $TERM == "alacritty"
    let transl = ""
    let transr = ""
    let sepl = ""
    let sepr = ""
    let glyphro = ""
    let glyphff = {"dos":"", "unix":"", "mac":""}
    let glyphft = {"PKGBUILD": "", "aml": "ﭲ", "arch": "", "bdf": "ﯔ", "c": "ﭰ", "calendar": "", "cfg": "漣", "conf": "漣", "config": "漣", "cpp": "ﭱ", "cs": "", "csh": "","css": "", "desktop": "ﲾ", "dns": "", "dnsmask": "", "dockerfile": "", "dosbatch": "", "dosini": "", "git": "", "gitcommit": " ", "gitconfig": " 漣", "gitrebase": " ", "gitsendemail": " ", "haskel": "", "help": "ﬤ", "html": "", "java": "", "javascript": "", "javascriptreact": " ﰆ", "json": "ﬥ", "lprolog": "ﬦprolog", "lscript": "ﬦscript", "lua": "", "mail": "", "mailaliases": " alias", "mailcap": " 漣", "man": "龎", "manconf": "龎漣", "manual": "龎", "maple": "", "markdown": "", "messages": "", "ninja": "ﱲ", "passwd": "ﳳ", "pdf": "", "perl": "", "perl6": "", "php": "", "prolog": "", "python": "", "r": "ﳒ", "rhelp": "ﳒ ﬤ", "rmd": "ﳒ ", "rnoweb": "ﳒ noweb", "robots": "ﮧ", "rrst": "ﳒ rst", "ruby": "", "rust": "", "scala": "", "sh": "", "svg": "ﰟ", "tar": "", "tcsh": "", "text": "", "vim": "", "viminfo": " ", "xhtml": "謹", "xml": "謹", "zsh": ""}
else
    let transl = " "
    let transr = " "
    let sepl = "|"
    let sepr = "|"
    let glyphro = "RO"
    let glyphff = {"dos":"dos", "unix":"unix", "mac":"mac"}
    let glyphft = {}
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
        if has_key(g:glyphft, &filetype)
            let statusline.= "%5* %{glyphft[&filetype]} %4*%{sepl}"
        else
            let statusline.= "%5* %{&filetype} %4*%{sepl}"
        endif
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

