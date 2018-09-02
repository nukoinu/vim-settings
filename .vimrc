" シンタックス 
syntax enable

" テーマ選択
set t_Co=256
set background=dark
color PaperColor

" エンコーディング
set encoding=utf-8
set fileencodings=utf-8,cp932

" カーソルラインの表示
set cursorline
set cursorcolumn

" フォント
set guifont=RictyDiminished-Regular:h16

" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定
set ambiwidth=double
" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu
" 
set wildmode=longest:full,full

"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch

"----------------------------------------
" 表示設定
"----------------------------------------
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" Windowsでパスの区切り文字をスラッシュで扱う
if has('win32')
    set shellslash
endif

" 対応する括弧やブレースを表示
set showmatch matchtime=1
" インデント方法の変更
"set cinoptions+=:0
" メッセージ表示欄を2行確保
set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 省略されずに表示
set display=lastline
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
" 行末のスペースを可視化
set listchars=tab:^-
" コマンドラインの履歴を10000件保存する
set history=10000
" コメントの色を水色
" hi Comment ctermfg=3
" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab
" オートインデント
set autoindent
" スマートインデント
set smartindent
" インデント幅
set shiftwidth=4
" タブキー押下時に挿入される文字幅を指定
set softtabstop=4
" ファイル内にあるタブ文字の表示幅
set tabstop=4
" ツールバーを非表示にする
set guioptions-=T
" yでコピーした時にクリップボードに入る
set guioptions+=a
" メニューバーを非表示にする
set guioptions-=m
" 右スクロールバーを非表示
set guioptions+=R
" 対応する括弧を強調表示
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" スワップファイルを作成しない
set noswapfile
" 検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
" タイトルを表示
set title
" 行番号の表示
set number
" ヤンクでクリップボードにコピー
set clipboard+=unnamed
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" すべての数を10進数として扱う
set nrformats=
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" バッファスクロール
set mouse=a

" バックスペースでなんでも消せるようにする
set backspace=indent,eol,start

" j,k による移動を折り返されたテキストでも自然に振る舞うよう変更
nnoremap j gj
nnoremap k gk

" 編集補助
" [ と打ったら [] って入力されてしかも括弧の中にいる(以下同様)
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {}<left>
"inoremap " ""<left>
inoremap ' ''<left>

" タブ間の移動
nnoremap <C-n> gt
nnoremap <C-p> gT

" NERDTree用

map <C-e> <plug>NERDTreeTabsToggle<CR>
    
let NERDTreeShowHidden=1 " 隠しファイルを表示する

" syntastic用
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/dein')
    call dein#begin('~/.vim/dein')

    " Let dein manage dein
    " Required:
    call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here:
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')

    " ファイルをツリー表示
    call dein#add('scrooloose/nerdtree')
    call dein#add('jistr/vim-nerdtree-tabs')
    call dein#add('Xuyuanp/nerdtree-git-plugin')

    " git 表示
    call dein#add('tpope/vim-fugitive')

    " URL を開く
    call dein#add('tyru/open-browser.vim')

    " 構文チェック
    call dein#add('vim-syntastic/syntastic')

    " You can specify revision/branch/tag.
    call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

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

"End dein Scripts-------------------------
