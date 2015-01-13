" Enable no Vi compatible commands.
set nocompatible

" 行番号表示
set number

" 閉じカッコが入力されたとき、対応するカッコを表示
set showmatch

" カーソル行をハイライトする
set cursorline
set cursorcolumn

highlight CursorLine   cterm=NONE ctermbg=Black
highlight CursorColumn            ctermbg=Black


" インデント
set autoindent
set smartindent

" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

" tab
set expandtab
set ts=2

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" 検索結果をハイライトする
set hlsearch
