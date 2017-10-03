if [[ "$PROF_ZSH" == true ]]; then
    zmodload zsh/zprof # Output load-time statistics
    # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
    PS4=$'%D{%M%S%.} %N:%i> '
    exec 3>&2 2>"${XDG_CACHE_HOME:-$HOME/tmp}/zsh_statup.$$"
    setopt xtrace prompt_subst
fi
# ---------------------------------------
# Work around, nasty hacks.
# ---------------------------------------
# Disable prompt from grml-zsh
command -v prompt &> /dev/null && prompt off

source ${HOME}/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle tmux
antigen bundle tmuxinator
antigen bundle vagrant
antigen bundle bundler
antigen bundle python
antigen bundle history-substring-search

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme ys

# Tell Antigen that you're done.
antigen apply

# ---------------------------------------
# Zgen/Antigen Setup
# ---------------------------------------
# Load zgen
# source ${HOME}/.zgen/zgen.zsh
#
# # check if there's no init script
# if ! zgen saved; then
#   echo "Creating a zgen save"
#
#   # Load robbyrussell's oh-my-zsh's library
#   zgen oh-my-zsh
#
#   # Plugins from robbyrussell's oh-my-zsh
#   zgen oh-my-zsh plugins/tmux
#   zgen oh-my-zsh plugins/tmuxinator
#   zgen oh-my-zsh plugins/vagrant
#   zgen oh-my-zsh plugins/bundler
#   zgen oh-my-zsh plugins/pip
#   zgen oh-my-zsh plugins/python
#   zgen oh-my-zsh plugins/virtualenv
#   zgen oh-my-zsh plugins/command-not-found
#   zgen oh-my-zsh plugins/history-substring-search
#
#   # Github plugins
#   zgen load rupa/z
#   zgen load zsh-users/zsh-syntax-highlighting
#   zgen load zsh-users/zsh-completions src
#   zgen load kennethreitz/autoenv
#
#   # Load theme
#   zgen oh-my-zsh themes/ys
#
#   # Tell zgen that you're done
#   zgen save
# fi

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
export GOBIN="$HOME/src/golang/gocode/bin"
export BIN="/usr/local/bin"
export SBIN="/usr/local/sbin"

export PATH=$MYBIN:$DOTBIN:$BIN:$SBIN:$GOROOT/bin:$GOPATH/bin:$GOBIN:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# ---------------------------------------
# Environmental Variables
# ---------------------------------------
export EDITOR="vim"
export TERM=xterm-256color

# source $(brew --prefix nvm)/nvm.sh

# ---------------------------------------
# Chruby
# ---------------------------------------
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# ---------------------------------------
# Gruvbox Color
# ---------------------------------------
source "$HOME/.vim/bundle/colorscheme/gruvbox/gruvbox_256palette_osx.sh"

BASE16_SHELL=$HOME/.meinekonfig/config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export NVM_DIR="/Users/kareem/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
#
# autoload -U add-zsh-hook
# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"
#
#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
#
#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   elif [ "$node_version" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc
if [[ "$PROFILE_STARTUP" == true ]]; then
    zprof
    unsetopt xtrace
    exec 2>&3 3>&-
fi
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
