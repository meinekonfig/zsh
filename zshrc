# ---------------------------------------
# Work around, nasty hacks.
# ---------------------------------------

  # Disable prompt from grml-zsh
  command -v prompt &> /dev/null && prompt off

# ---------------------------------------
# Zgen/Antigen Setup
# ---------------------------------------

  # Load zgen
  source ${HOME}/.zgen/zgen.zsh

  # check if there's no init script
  if ! zgen saved; then
    echo "Creating a zgen save"

    # Load robbyrussell's oh-my-zsh's library
    zgen oh-my-zsh

    # Plugins from robbyrussell's oh-my-zsh
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/tmuxinator
    zgen oh-my-zsh plugins/vagrant
    zgen oh-my-zsh plugins/bundler
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/python
    zgen oh-my-zsh plugins/virtualenv
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/history-substring-search

    # Github plugins
    zgen load rupa/z
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions src
    zgen load kennethreitz/autoenv

    # Load theme
    zgen oh-my-zsh themes/ys

    # Tell antigen that you're done
    zgen save

  fi

# ---------------------------------------
# User Aliases
# ---------------------------------------
  source $HOME/.zsh/aliases

# ---------------------------------------
# Functions
# ---------------------------------------

  source $HOME/.zsh/functions

# ---------------------------------------
# PATHS
# ---------------------------------------
  export MYBIN="$HOME/bin"
  export DOTBIN="$HOME/.meinekonfig/bin"
  export GOPATH="$HOME/src/golang/gocode"
  export GOROOT="$HOME/src/golang/go"
  export GOBIN="$HOME/src/golang/bin"
  export BIN="/usr/local/bin"
  export SBIN="/usr/local/sbin"

  export PATH=$MYBIN:$DOTBIN:$BIN:$SBIN:$GOROOT/bin:$GOPATH/bin:$GOBIN:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# ---------------------------------------
# Environmental Variables
# ---------------------------------------
  export EDITOR="vim"
  export TERM=xterm-256color

# ---------------------------------------
# Chruby
# ---------------------------------------
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# ---------------------------------------
# Gruvbox Color
# ---------------------------------------
source "$HOME/.vim/bundle/colorscheme/gruvbox/gruvbox_256palette.sh"

[[ -s "/Users/kgan/.gvm/scripts/gvm" ]] && source "/Users/kgan/.gvm/scripts/gvm"
