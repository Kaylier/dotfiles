
" Init of perso colors
highlight User0 cterm=bold ctermbg=16 ctermfg=15
highlight User1 cterm=bold ctermbg=11 ctermfg=16
highlight User2 cterm=bold ctermbg=15 ctermfg=16
highlight User3 cterm=bold ctermbg=7 ctermfg=16
highlight User4 cterm=bold ctermbg=12 ctermfg=15
highlight User5 cterm=bold ctermbg=4 ctermfg=15
highlight User6 cterm=bold ctermbg=16 ctermfg=15
highlight User7 cterm=bold ctermbg=none ctermfg=15
highlight User8 cterm=bold ctermbg=3 ctermfg=16
highlight User9 cterm=bold ctermbg=3 ctermfg=9

set laststatus=2
set statusline=
set statusline+=%9*%h                               " Help flag
set statusline+=%1*%m                               " Modified flag
set statusline+=%1*%r                               " Readonly flag
set statusline+=%2*\ %t\                            " File name (tail)
set statusline+=%3*%y                               " File type
set statusline+=%4*\ %{strlen(&fenc)?&fenc:&enc}\   " Encoding 
set statusline+=%4*%{&bomb?'\ ,BOM\ ':''}           " Encoding BOM (if defined)
set statusline+=%5*\ %{&ff}\                        " File format (dos/unix)
set statusline+=%6*\ %{&spelllang}\                 " Spell language
set statusline+=%7*%=
set statusline+=%1*%{&paste?'[P]':''}               " Paste mode flag
set statusline+=%5*\ L%l/%L\ (%03p%%)\              " Row number/total (%)
set statusline+=%4*\ c%02c\                         " Column number
set statusline+=%3*\ %P\                            " Top/Bottom 
