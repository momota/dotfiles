" ======================================================================
" dein.vim
" ======================================================================

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neocomplcache')

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('wincent/command-t')
  call dein#add('thinca/vim-quickrun')
  call dein#add('thinca/vim-fontzoom')
  call dein#add('davidoc/taskpaper.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('itchyny/vim-cursorword')
  call dein#add('itchyny/calendar.vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('kana/vim-arpeggio')
  call dein#add('tpope/vim-fugitive')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('rking/ag.vim')
  call dein#add('h1mesuke/vim-alignta')
  call dein#add('vim-scripts/vim-auto-save')
  call dein#add('tpope/vim-surround')
  call dein#add('mechatroner/rainbow_csv')

  " lint
  call dein#add('scrooloose/syntastic')

  " incsearch
  call dein#add('haya14busa/incsearch.vim')
  call dein#add('haya14busa/incsearch-fuzzy.vim')
  call dein#add('haya14busa/incsearch-migemo.vim')

  " syntax highlight
  call dein#add('plasticboy/vim-markdown')
  call dein#add('joker1007/vim-markdown-quote-syntax')
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('slim-template/vim-slim')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('momota/junos.vim')
  call dein#add('momota/cisco.vim')
  call dein#add('Konfekt/FastFold')
  call dein#add('hashivim/vim-terraform')
  call dein#add('leafgarland/typescript-vim')

  " colorscheme
  call dein#add('flazz/vim-colorschemes')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('tomasr/molokai')

  " icons
  call dein#add('ryanoasis/vim-devicons')

  " markdown
  call dein#add('dhruvasagar/vim-table-mode')

  " You can specify revision/branch/tag.
  "call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


" ----------------------------------------------------------------------
" neocomplete


"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" For neco-look setting.
" enable neco-look at all filetype
if !exists('g:neocomplete#text_mode_filetypes')
    let g:neocomplete#text_mode_filetypes = {}
endif
let g:neocomplete#text_mode_filetypes = { "_" : 1}

" ----------------------------------------------------------------------
" unite

"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]
 
"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 200
 
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''
 
"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)
  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "ctrl+jで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  "ctrl+lで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}



" ----------------------------------------------------------------------
" lightline.vim

set t_Co=256
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


" ----------------------------------------------------------------------
" neosnippet

" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"
" スニペットファイルの保存ディレクトリのパスを登録
let g:neosnippet#snippets_directory='~/vimfiles/bundle/snippets'

" 補完メニューの高さ指定
set pumheight=10


" ----------------------------------------------------------------------
" vim-indent-guides

" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーを有効にする
let g:indent_guides_auto_colors=1
" 奇数インデントのカラー
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
" 偶数インデントのカラー
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey
" ハイライト色の変化の幅
"let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1


" ----------------------------------------------------------------------
" arpeggio.vim: キー同時押しのマッピング

" arpeggioをこのvimrc内で有効にする
call arpeggio#load()

" <Esc>をfj同時押しにマッピング
Arpeggionmap fj <Esc>
Arpeggioimap fj <Esc>
Arpeggiocmap fj <Esc>
Arpeggiovmap fj <Esc>


" ----------------------------------------------------------------------
" incsearch.vim

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" fuzzy search
"map z/ <Plug>(incsearch-fuzzy-/)
"map z? <Plug>(incsearch-fuzzy-?)
"map zg/ <Plug>(incsearch-fuzzy-stay)

" fuzzy spell search
map z/ <Plug>(incsearch-fuzzyspell-/)
map z? <Plug>(incsearch-fuzzyspell-?)
map zg/ <Plug>(incsearch-fuzzyspell-stay)

" migemo search
map m/ <Plug>(incsearch-migemo-/)
map m? <Plug>(incsearch-migemo-?)
map mg/ <Plug>(incsearch-migemo-stay)


" ----------------------------------------------------------------------
" syntastic: for lint (rubocop, pylint, etc...)

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby']}
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_memo_checkers = ['textlint']
let g:syntastic_mail_checkers = ['textlint']
let g:syntastic_markdown_checkers = ['textlint']

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='!'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '!'
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" ----------------------------------------------------------------------
" open browser

let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" ----------------------------------------------------------------------
" calendar

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1


" ----------------------------------------------------------------------
" vim-markdown

" Enable TOC window auto-fit
let g:vim_markdown_toc_autofit = 1
" To disable conceal regardless of conceallevel setting
let g:vim_markdown_conceal = 0
" To disable the folding configuration
let g:vim_markdown_folding_disabled = 1

" ----------------------------------------------------------------------
" syntax file

augroup filetype
  au! BufRead,BufNewFile *.slim   set filetype=slim
  au! BufRead,BufNewFile *.coffee set filetype=coffee
augroup END 

" ----------------------------------------------------------------------
" vim-auto-save

let g:auto_save = 1
" do not save while in insert mode
let g:auto_save_in_insert_mode = 0

" ----------------------------------------------------------------------
" vim-table-mode


function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" For Markdown-compatible tables
let g:table_mode_corner='|'


" ======================================================================
" conf
" ======================================================================

" ----------------------------------------------------------------------
"   表示に関する設定
" syntax highlight
syntax on

" 行番号表示
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" 閉じカッコが入力されたとき、対応するカッコを表示
set showmatch
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title

" カーソル行をハイライトする
set cursorline
set cursorcolumn
highlight CursorLine   cterm=NONE ctermbg=Black
highlight CursorColumn            ctermbg=Black


" IME color
if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=Green
  highlight CursorIM guifg=NONE guibg=Green
endif


" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/



" ----------------------------------------------------------------------
"   編集に関する設定
" tab
set tabstop=2
set shiftwidth=2
set expandtab

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" インデント
set autoindent
set smartindent

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 自動折り返しをoff
set textwidth=0

" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

" mac: yank のクリップボード連携
set clipboard=unnamedplus,autoselect

" ----------------------------------------------------------------------
"   検索の挙動に関する設定
" 検索結果をハイライトする
set hlsearch
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan

" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" " 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase


" ----------------------------------------------------------------------
"   検索の挙動に関する設定

" 垂直分割でヘルプを表示する [<Space> + h <help-file>]
nnoremap <Space>h :<C-u>vert bel h<Space>

" 垂直分割でdiff [<Space> + vd <diff-file>]
nnoremap <Space>vd :<C-u>vertical diffsplit<Space>

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


" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu

" Yを行末までヤンクにするマッピング
nnoremap Y y$

" コマンド履歴数
set history=1000

" スワップファイルの出力先
set directory=/tmp

" バックアップファイルの出力先
set backupdir=/tmp

" ----------------------------------------------------------------------
" colorscheme

"call togglebg#map("<F5>")
"let g:solarized_termcolors=16
"let g:solarized_termtrans=0
"let g:solarized_degrade=0
"let g:solarized_bold=1
"let g:solarized_underline=1
"let g:solarized_italic=0
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"
"set background=dark
"colorscheme solarized
colorscheme molokai
