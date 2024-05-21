# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
export ZSH=$HOME/.oh-my-zsh

stty -ixon

plugins=(git)
tmux_session=common

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"

ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

export HOMEBREW_AUTO_UPDATE_SECS=86400
export HISTSIZE=200000
export SAVEHIST=200000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

# Aliases
# alias vim='vim'
alias be='bundle exec'
alias x='exit'
alias v='nvim'
alias sv="sudo nvim"
alias s='subl'
alias t='touch'
alias md='mkdir'
alias g='gedit'
alias p='pry'
alias mysql='mysql --auto-rehash'
alias kl='kill -9'
alias o='xdg-open'
alias ctg='ctags -R --exclude=.git --exclude=log -f tmp/tags *'
alias ctags="`brew --prefix`/bin/ctags -R --exclude=.git --exclude=log *"

alias ls='ls -G'

# alias ls='ls --color=auto'

alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gcam='git commit --amend -m'
alias gcmf='git commit -m "Minor fix"'
alias gcmfs='git commit -m "Minor fixes"'
alias gp='git push'
alias gs='git status -s'
alias gr='git reset'
alias gcl='git clone'
alias gpl='git pull --rebase'
alias gsh='git stash'
alias gsha='git stash apply'
alias gco='git checkout'

alias gl="git log --date-order --date=iso --graph --full-history --all --pretty=format:'%x08%x09%C(red)%h %C(cyan)%ad%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08 %C(bold blue)%<(10)%aN%C(reset) %C(reset)%<(70,trunc)%s%C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset) '"

alias sudo apt-get install='sudo apt-get install -y'
alias sudo apt-get add-apt-repository='sudo apt-get add-apt-repository -y'
alias f=fg
alias si='sudo apt-get install -y'
alias sp='sudo apt-get purge'
alias bi='bundle init --gemspec=~/.gemspec_template'
alias bl='bundle install'
alias bgi='gem install'

alias ez="nvim ~/.zshrc"
alias ev="nvim ~/.vimrc"

alias rc='rails c'
alias rs='rails s'
alias rr='bundle exec rake routes'
alias rs2='ruby script/server -u'
alias rc2='ruby script/console'
alias rdb='bundle exec rake db:migrate'
alias rdbr='bundle exec rake db:rollback'
alias be='bundle exec'
alias ber='bundle exec rspec'

zstyle ':completion:*' rehash true

alias rs="bundle exec rails s"

# for GOLANG installation
export GOPATH=$HOME/workspace/go
export PATH=$PATH:/usr/local/go/bin

# python env
# eval "$(pyenv init -)"
# PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
# PATH="$PATH:$PYTHON_BIN_PATH"
# For compilers to find zlib you may need to set:
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

# For pkg-config to find zlib you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
export PATH="/usr/local/opt/v8@3.15/bin:$PATH"

# ITGlue docker commands
export DEV_PATH=$HOME/workspace/dev/itglue-dev-env
alias d-c="$DEV_PATH/compose.sh"
alias naprodcron="ssh fturliuk@172.31.48.90"
alias euprodcron="ssh fturliuk@10.164.20.31"
railsc () {
  container=${1:-app}
  d-c exec $container bundle exec rails c
}
railsdb () {
  container=${1:-app}
  d-c exec $container bundle exec rails db
}
drspec () {
  container=${1:-app}
  d-c exec $container bundle exec rspec $2
}
dbash () {
  container=${1:-app}
  d-c exec $container /bin/bash
}
dlogs () {
  container=${1:-app}
  d-c logs -f $container
}
dsync () {
  ( cd $DEV_PATH && command "docker-sync" "$@" )
}
dpry () {
  container=${1:-app}
  d-c logs $container | tail -n 30
  docker attach $(d-c ps -q $container)
}
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/texinfo/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"
export DOCKER_BUILDKIT=0
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /Users/fiodar_turliuk/.docker/init-zsh.sh || true # Added by Docker Desktop

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
