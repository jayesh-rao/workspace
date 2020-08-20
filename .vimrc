""" Search settings """
set ignorecase " Ignore case by default
set incsearch " Enable incremental search
set hlsearch " highlight searched for phrases

""" UI settings """

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
set history=50
set viminfo='100

""" Visual cues """
syntax on " syntax highlighting on
set ruler " show the cursor position
set showmatch " show matching brackets
set matchtime=5 " how many tenths of a second to blink matching brackets for
set scrolloff=5 " Keep 5 lines (top/bottom) for scope
set sidescrolloff=5 " Keep 5 lines at the size
set novisualbell " don't blink
set nu           " use line numbers

""" Column line 80 """
""" highlight OverLength ctermbg=red ctermfg=white guibg=#592929 """
"""match OverLength /\%81v.\+/ """

""" Color settings """
set t_Co=256
highlight Normal ctermfg=Black ctermbg=White
highlight Normal ctermfg=White ctermbg=Black
highlight Search ctermfg=Black

""" Indenting settings """
set softtabstop=4
set shiftwidth=4
set expandtab
set nosmartindent " smartindent (filetype indenting instead)
set autoindent
set cindent      
set cinoptions=g0:0 " No indent for public: or case:
set copyindent " but above all -- follow the conventions laid before us
filetype plugin indent on " load filetype plugins and indent settings

""" File type detection """
augroup filetypedetect
    au! BufRead,BufNewFile *.t setfiletype perl
augroup END

augroup Makefile
    au!
    au BufReadPre Makefile set noexpandtab
augroup END

""" Ease of use """
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

"cscope connection
if has("cscope")
	set csto=0
	set cst
	set nocsverb
	if $CSCOPE_DB != ""
		cs add $CSCOPE_DB $CSCOPE_PRE_PATH
	elseif filereadable("cscope.out")
		cs add cscope.out
	endif

	"set csverb
	if filereadable("tree_top/prod/build/cscope.out")
		set csprg=/usr/local/bin/cscope
	elseif filereadable("tools/bedrock/export/common/cscope/cscope.out")
		set csprg=/usr/software/rats/bin/cscope-15.6
		cs add tools/bedrock/export/common/cscope/cscope.out
	endif
endif

"vimdiff unfold everything
"nmap \f :set foldmethod=manual<CR>:1<CR>zE:wincmd W<CR>:set foldmethod=manual<CR>:1<CR>zE

"highlight DiffAdd        term=bold ctermbg=green guibg=red
"se foldcolumn=0

"se laststatus=2

" find callers of this function
noremap `c :cs find c <C-R>=expand("<cword>")<CR><CR>
" find definition
noremap `g :cs find g <C-R>=expand("<cword>")<CR><CR>
" find C symbol
noremap `s :cs find s <C-R>=expand("<cword>")<CR><CR>
" find egrep pattern
noremap `e :cs find e <C-R>=expand("<cword>")<CR><CR>
" find assignments to
noremap `t :cs find t <C-R>=expand("<cword>")<CR><CR>
" find functions called by this function
noremap `d :cs find d <C-R>=expand("<cword>")<CR><CR>
" find this file
noremap `f :cs find f <C-R>=expand("<cword>")<CR><CR>
" find files which #include this file
noremap `i :cs find i <C-R>=expand("<cword>")<CR><CR>

noremap `z :cs show<CR>
noremap `k :cs kill
noremap `a :call Addcs()<CR>

map g<C-]> :cs find s <C-R>=expand("<cword>")<CR><CR>

map qq :q<CR>:q<CR>

"Pathogen"
"execute pathogen#infect()

