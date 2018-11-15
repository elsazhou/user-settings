
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export DEV_PATH=$HOME/Documents/ITG/itglue-dev-env
alias d-c="$DEV_PATH/compose.sh"
railsc () {
  container=${1:-app}
  d-c exec $container bundle exec rails c
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
export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
source ~/.bashrc


# command line
alias ~="cd ~"
alias ..="cd .."
alias ls="ls -al"
alias gc="git checkout"

source ~/.profile


# editor
export EDITOR='code -w'


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# brew install git bash-completion
# bash autocomplete
[ -f "/usr/local/etc/bash_completion" ] && \. "/usr/local/etc/bash_completion"
