runtime! archlinux.vim " Ensure compatibilities with the Vim-related packages

" General {{{

set title
set showmode " Display the mode
"set insertmode " Make Insert mode the default
if has('mouse')
    set mouse=a " Mouse activated in All Modes
    set mousefocus
    set mousehide
endif
set history=100 " Number of lines of history
filetype plugin indent on
set report& " Threshold for reporting number of lines changed

set confirm

set browsedir=last " Directory to use for file browser
set noautochdir " Change working directory when a file is opened
set autoread " When the file is changed outside but not in vim, read again
"set autowrite " Write the file on many commands
"set autowriteall " Write the file on much more commands

set nobackup " Make a backup before overwriting a file
set writebackup " Make a backup before overwriting a file, removed after
set backupcopy=auto " Create a copy before overwriting
set backupdir=/tmp " Backup directory
set backupext=~ " Extension of backup file
set backupskip& " Types of files to not backup

set swapfile& " Use a swapfile for the buffer
set directory& " List of directory names for the swap file
set suffixes& " Suffixes of low-priority files
set updatecount& " Number of character before the swap file is written to disk
set updatetime&

set undofile " Save history in an undo file
set undodir& " Directory of undo files
set undolevels& " Maximum of changes that can be undone

set casemap& " Details about changing the case of letters
set ambiwidth=single " Width of special characters
set nodigraph " Enable the entering of digraphs
set fileencoding=utf-8 " The encoding written to file
set nobomb " Prepend a BOM (Byte Order Mark) to the file
set fileformat=unix " The format of the file
set fileformats=unix,dos,mac

set secure " Secure the external command aspect

"set revins " Insert backward
"set rightleft " Display from right to left

" }}}
" Comportement {{{

set clipboard=unnamed
set nopaste " Desactive le mode collage
set pastetoggle=<F2> " Touche de modification de mode collage

set scrolljump& " Number of lines to scroll when the cursor gets off the screen
set scrolloff=4 " Always keep n lines after or before when side scrolling
"set sidescrolloff=7 " Always keep n lines after or before when side scrolling
set display=truncate,uhex,msgsep " Change the way the text is displayed
set emoji

set nojoinspaces
set nrformats=octal,hex,bin

set backspace=indent,eol,start " The normal behaviour of backspace
set nodelcombine
"set virtualedit=onemore " Allow the cursor just past the end of the line
set selectmode=cmd,mouse " Active le mode Selection avec la souris
set selection=inclusive " Selection behavior

set noallowrevins " Allow CTRL-_ in Insert and Command-line mode

set errorbells
set belloff=complete,esc,ex,hangul,insertmode,lang,mess,showmatch,operator,register,spell,wildmode

set diffopt=filler,context:4,iblank,icase,iwhite,iwhiteall,iwhiteeol,internal

" }}}
" Indentation {{{

filetype indent on
"set cindent
"set autoindent
set smartindent
"set indentexpr= " Personalized indentation
set expandtab " Replace tabs with spaces
set smarttab " Smart choice in replacement (useful if tabstop != softtabstop)
set softtabstop=4 " Insert n spaces
set tabstop=4 " Draw reals tabs with n spaces
set shiftwidth=4 " Indent with n spaces
set shiftround " When using > and <, round to the nearest tabstop

set copyindent " Re-indent when copying
set preserveindent " Keep the indentation

" }}}
" Recherche {{{

set incsearch " Search before pressing Enter
set hlsearch " Highlight search results
set gdefault " The substitute flag 'g' is on

set ignorecase " Search case-insensitive
set smartcase " Search smart (case-sensitive if Maj in the word)
"set infercase
set magic " regular expressions

" }}}
" Auto-completion {{{

set wildmenu " Better command-line completion
set wildchar=<Tab> " Character to type to start wildcard expansion
set wildignorecase " Ignore case when completing file names

set wildmode=list:longest,list:full
set wildmode=longest,list
set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz
set menuitems& " Maximum number of items in a menu
set pumheight=0 " Maximum number of items to show in the popup menu

set complete=.,w,b,u,t
set completeopt=menuone,preview
set showfulltag " Show full template for C completion
set dictionary& " List of file names used for completion

function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
setlocal spelllang=en,fr
"setlocal spell
set spellfile& " List of word list files
set infercase " Automatic case in completion

set omnifunc=syntaxcomplete#Complete


" }}}
" Repliement {{{

set foldenable
set foldlevelstart=99 " 0 : tout est foldé, 99 : rien n'est foldé
set foldmethod=syntax
set foldignore= " Lines starting with theses characters are ignored
set foldminlines=1 " Minimum of line to be considered as foldable
set foldclose= " When set to all, auto close when the cursor moves out
set foldcolumn=0 " When 1, show a column on the side showing folds
set foldopen& " Commands for which folds will be opened
nnoremap <space> za
nnoremap <S-space> zA
set foldmarker={{{,}}}
set foldtext& " Expression displayed for closed folds

set concealcursor=nvc " Conceal the text in normal, visual and command modes
set conceallevel=1

source ~/.config/nvim/conceals.vim

" }}}
" Optimisations {{{

set shortmess=aoOstTWIF
set lazyredraw " Redraw only when we need to

set hidden " Hide the buffer instead of closing
set bufhidden& " What happens when a buffer is no longer display
set updatetime=4000 " Idle time before writting the swap to disk

" Prevent lag when hitting escape
set ttimeoutlen=0
set timeoutlen=200
au InsertEnter * set timeout
au InsertLeave * set notimeout

" }}}
" Raccourcis/commandes personnalisées {{{

set remap " Allow recursive mappings

" Escape with kj
inoremap kj     <Esc>

" Increment (<C-a> is used for an other purpose)
nnoremap <C-w>  <C-a>
" Go to the beginning of the line
nnoremap <C-a>  ^
" Go at the end of the line
nnoremap <C-e>  $
" Go to the beginning of the line in Insert mode
inoremap <C-a>  <Esc>^i
" Go at the end of the line in Insert mode
inoremap <C-e>  <Esc>$a

noremap µ :noh<Enter>

" Enregistre avec les droits root
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Save with Ctrl+S and Quit with Ctrl+C
nmap <C-c>      :q<Enter>
imap <C-c>      <Esc>

function! ToggleView()
    if (&relativenumber == 1)
        set norelativenumber
        set number
        set conceallevel=1
        set diffopt=filler,context:4,iblank,icase,iwhite,iwhiteall,iwhiteeol,internal
    else
        set relativenumber
        set conceallevel=0
        set diffopt=filler,context:4,internal
    endif
endfunc
nmap , :.call ToggleView()<cr>


" }}}
" Apparence {{{

syntax enable " Enable syntax highlights
if $TERM == "alacritty"
    set termguicolors
endif

set list
set listchars=tab:\ \ ·,trail:·,extends:…,precedes:…,conceal:…,nbsp:␣
set fillchars=stl:\ ,stlnc:\ ,fold:─,diff:\ ,eob:\ 

set number " Show the line number
"set relativenumber " Show the line number relative to the cursor
"set ruler " Show the position of the cursor
"set rulerformat& " Determine the content of ruler string
set cursorline " Highlight the cursor line
set cursorcolumn " Highlight the cursor column

" Surligne en rouge les lignes trop longues
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%>80v.\+/

set showmatch " When a bracket is inserted, jump to the matching one
set matchpairs=(:),{:},[:],<:> " List of pairs to match
"set maxfuncdepth& " Max depth of function calls
set matchtime=3 " ... during this time (tenths of a second)

set wrap " Wrap the line when it's longer than the width of the window
set wrapscan " Search wrap around the end of the file
set linebreak
set breakat&
set breakindent
set breakindentopt=min:80
set showbreak=↳ " See this char when wrapping text
set whichwrap=b,s,<,>,[,]

"colorscheme
colorscheme tender

source ~/.config/nvim/statusline.vim


" }}}
" Fichiers spécifiques {{{

set modeline " Autorise les arguments dans les fichiers (ex:cf fin de celui-ci)
set modelines=10 " Number of lines that is checked from the end of the file
"set exrc " Enable the reading of a local ./.vimrc

autocmd VimEnter * if eval("@%") == "" | set buftype=nofile  | endif

autocmd FileType latex inoremap j gj
autocmd FileType latex inoremap k gk
autocmd FileType latex,text set spell
autocmd FileType latex,text set complete+=kspell,s
"autocmd BufEnter Makefile setlocal noexpandtab
autocmd FileType python set foldmethod=indent
autocmd FileType c,cpp set complete+=i,d
autocmd FileType c,cpp set foldignore=#

" }}}

" vim:filetype=vim:syntax=vim
" vim:foldmethod=marker:foldlevel=0
