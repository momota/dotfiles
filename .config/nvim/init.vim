filetype plugin indent off

if &compatible
  set nocompatible               " Be iMproved
endif

" ----------------------------------------------------------------------------
"  plugin
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------
"  dein.vim
"

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin($HOME . '/.cache/dein')

let s:toml_dir  = $HOME . '/.config/nvim/dein/toml' 
let s:toml      = s:toml_dir . '/dein.toml'
let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

" TOML を読み込み、キャッシュしておく
call dein#load_toml(s:toml,      {'lazy': 0})
call dein#load_toml(s:lazy_toml, {'lazy': 1})

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


" ----------------------------------------------------------------
" let s:dein_dir      = $HOME . '/.cache/dein'
" let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" 
" execute 'set runtimepath+=' . s:dein_repo_dir
" 
" if dein#load_state(s:dein_dir)
"   let g:dein#cache_directory = s:dein_dir
" 
"   call dein#begin(s:dein_dir)
"   call dein#add(s:dein_repo_dir)
" 
"   " プラグインリストを収め?? TOML ファイル
"   " 予め TOML ファイル（後述）を用意しておく
"   let s:toml_dir  = $HOME . '/.config/nvim/dein/toml' 
"   let s:toml      = s:toml_dir . '/dein.toml'
"   let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
" 
"   " TOML を読み込み、キャッシュしておく
"   call dein#load_toml(s:toml,      {'lazy': 0})
"   call dein#load_toml(s:lazy_toml, {'lazy': 1})
" 
"   call dein#end()
"   call dein#save_state()
" endif
" 
" " Required:
" filetype plugin indent on
" syntax enable
" 
" " If you want to install not installed plugins on startup.
" if dein#check_install()
"   call dein#install()
" endif


" ----------------------------------------------------------------------------
"  表示に関する設定
" ----------------------------------------------------------------------------

" 改行コードの指定
set fileformats=unix,dos,mac

" True Color(256色) でシンタックスハイライト
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" ファイルエンコーディング
set fileencodings=ucs-bombs,utf-8,euc-jp,cp932

syntax on

" 行番号表示
set number
" set relativenumber

" ルーラーを表示
set ruler

" タブや改行を表示しない
set nolist

" 閉じカッコが入力されたとき、対応するカッコを表示
set showmatch

" 行折り返し表示
set wrap

" 常にステータス行を表示
set laststatus=2

" コマンドラインの高さ
set cmdheight=2

" コマンドをステータス行に表示
set showcmd

" タイトルを表示
set title


" カーソル行をハイライト
set cursorline
set cursorcolumn
highlight CursorLine cterm=NONE ctermbg=Black
highlight CursorColumn ctermbg=Black

" IME color
if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Green
endif

" 全角スペース可視化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guifg=white
match ZenkakuSpace /　/


" set guifont=Cica:h16

" マウス操作
set mouse=a

" ----------------------------------------------------------------------------
"  編集に関する設定
" ----------------------------------------------------------------------------

" tab
set tabstop=2
set shiftwidth=2
set expandtab

" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" インデント
set autoindent
set smartindent

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

" 自動折り返しをOFF
set textwidth=0

" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

" yank のクリップボード連携
set clipboard=unnamed


" t に tabnew をマッピング
nnoremap t :<C-u>tabnew<CR>

" Shift + Tab にインデント1段下げをマッピング
" --- for command mode
nnoremap <S-Tab> <<
" --- for insert mode
inoremap <S-Tab> <C-d>
" Shift + Tab にインデント1段上げをマッピング
" --- for command mode
nnoremap <Tab> >>

" Y を行末まで yank する
nnoremap Y y$

" ----------------------------------------------------------------------------
"  検索に関する設定
" ----------------------------------------------------------------------------

" 検索結果をハイライトする
set hlsearch

" 検索時にファイルの最後尾まで行ったら最初に戻る
set wrapscan

" 検索時に大文字小文字を無視
set ignorecase

" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

" 文字列置換をインタラクティブに表示
set inccommand=split

" ----------------------------------------------------------------------------
"  コマンドラインなどに関する設定
" ----------------------------------------------------------------------------

" コマンドライン補完するときに強化されたものを使う
set wildmenu

" コマンド履歴数
set history=1000

" スワップファイルの出力先
set directory=~/.nvim/swap

" バックアップファイルの出力先
set backupdir=~/.nvim/backup

" undo ファイルの出力先
set undodir=~/.nvim/tmp


filetype plugin indent on
