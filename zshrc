export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="ys"

plugins=(docker virtualenvwrapper postgres laravel4 command-not-found capistrano  git urltools z sshtunnel sublime zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/Users/capa/.rbenv/shims:/Users/capa/.ebenv/bin:/usr/local/mysql/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/bin/npm:/Users/capa/.composer/vendor/bin

# oracle sqlplus
export PATH=/Users/capa/sqlplus-cli/12.1:$PATH
export NLS_LANG="TRADITIONAL CHINESE_TAIWAN".AL32UTF8

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk/Contents/Home
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)
export PATH=$JAVA_HOME/bin:$PATH

# yarn
export PATH="$HOME/.yarn/bin:$PATH"

alias c="clear"
alias y="yarn"
alias dudir="du -hs * | sort -hr"
eval "$(rbenv init -)"

# stop tar try to copy hidden files
export COPYFILE_DISABLE=true
export COPY_EXTENDED_ATTRIBUTES_DISABLE=true

# Base16 Material Theme
BASE16_SHELL="$HOME/.config/base16-shell/base16-material.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# python
# https://stackoverflow.com/questions/23997403/installed-virtualenv-and-virtualenvwrapper-python-says-no-module-named-virtuale/25583193#25583193
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
source /usr/local/bin/virtualenvwrapper.sh

