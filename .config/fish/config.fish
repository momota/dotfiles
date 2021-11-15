if status is-interactive
    # Commands to run in interactive sessions can go here
end

##
# 環境変数
##

# PATH
fish_add_path /opt/homebrew/bin/

# デフォルトエディタ
set -x EDITOR nvim

# neovim設定ファイルの path
set -gx XDG_CONFIG_HOME "$HOME/.config"

# fish-ghq: use peco
set -g GHQ_SELECTOR peco


##
# alias
##

# standard command
alias l   'ls -la'


# nvim
alias vi   'nvim'
alias vim  'nvim'
alias view 'nvim -R'


# tree
alias tree 'tree -NC'


# git
alias g   'git'

alias ga  'git add'
alias gaa 'git add --all'

alias gc  'git commit -v'
alias gc! 'git commit -v --amend'

alias gd 'git diff'

# ghq
alias ghb 'hub browse (ghq list | peco | cut -d "/" -f 2,3)'
alias ghv 'code (ghq list --full-path | peco)'

##
# 関数定義
##

# peco を使った cd
function lscd
  set target_dir (find . -maxdepth 1 -type d | sed -e 's;\./;;' | peco )
  if string length -q -- $target_dir
    cd $target_dir
  end
end

# キーバインディング
function fish_user_key_bindings
  # ctrl + r
  bind \cr 'peco_select_history'
end

# cd のあとに ls
function cd
  builtin cd $argv
  ls -la
end

# man の色付け
function man
  env \
  LESS_TERMCAP_mb=(printf "\e[1;31m") \
  LESS_TERMCAP_md=(printf "\e[1;31m") \
  LESS_TERMCAP_me=(printf "\e[0m") \
  LESS_TERMCAP_se=(printf "\e[0m") \
  LESS_TERMCAP_so=(printf "\e[1;44;33m") \
  LESS_TERMCAP_ue=(printf "\e[0m") \
  LESS_TERMCAP_us=(printf "\e[1;32m") \
  man $argv
end

# rbenv
# Load rbenv automatically by appending
status --is-interactive; and source (rbenv init -|psub)
