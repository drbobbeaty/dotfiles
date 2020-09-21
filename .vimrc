syntax on
filetype plugin indent on
set runtimepath^=~/.vim/bundle/ctrlp.vim
set ts=4
set sw=4
set si
set backspace=2
set guioptions=agimte
set formatoptions=croql
set nowrap
autocmd FileType rb,ruby,eruby,sql
\	set ai sw=2 sts=2 et
autocmd FileType c,cpp,h,java
\	set cindent
:autocmd FileType f,f90,F
\	set expandtab
autocmd FileType json
\	set ai sw=2 sts=2 et
autocmd FileType sql
\	set ai sw=2 sts=2 et
set autoindent
set ruler
set hlsearch
set fileformats=unix,mac,dos
set tags=tags;/
let ruby_no_expensive=1
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 2
let g:github_user = 'drbobbeaty'
let g:github_token = 'f7255882bd23ebf2e217adcd61cd3142'
"if (has("gui_running"))
if (has("gui_macvim"))
	autocmd BufEnter * :cd %:p:h
	set lines=40
	set columns=80
"	set gfn=Panic\ Sans:h9.00
"	set gfn=Consolas:h10.00
"	set gfn=Inconsolata:h10
"	set gfn=Hack:h9
"	set linespace=-2
	set gfn=Ubuntu\ Mono:h12
"	set transparency=10
	set guitablabel=%t
"	colorscheme torte
	colorscheme lucius
	LuciusWhite
	hi Cursor guibg=red
	hi Search guibg=orange
	nnoremap <D-1> :tabn 1<CR>
	nnoremap <D-2> :tabn 2<CR>
	nnoremap <D-3> :tabn 3<CR>
	nnoremap <D-4> :tabn 4<CR>
	nnoremap <D-5> :tabn 5<CR>
	nnoremap <D-6> :tabn 6<CR>
	nnoremap <D-7> :tabn 7<CR>
	nnoremap <D-8> :tabn 8<CR>
	nnoremap <D-9> :tabn 9<CR>
	nnoremap <SwipeLeft> gt
	nnoremap <SwipeRight> gT
	" there's also SwipeUp, SwipeDown, PinchIn, PinchOut, RotateCW, RotateCCW
endif
