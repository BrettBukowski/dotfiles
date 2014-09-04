# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git dircycle history-substring-search last-working-dir git-extras wd gitignore z)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PATH=/usr/local/opt:/Library/Frameworks/Python.framework/Versions/3.3/bin:/usr/local/bin:/Library/Frameworks/Python.framework/Versions/3.3/bin:/Users/brettb/pear/bin:/Users/brettb/bin:/opt/local/bin:/opt/local/sbin:/Users/brettb/local/node/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/deployd/bin:/Users/brettb/bin

if [ -f ~/dotfiles/bashrc ]; then
   source ~/dotfiles/bashrc
fi

if [ -f ~/.liquidpromptrc ]; then
   source ~/.liquidpromptrc
fi

# zsh-bd
# . $HOME/.zsh/plugins/bd/bd.zsh

source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby 2.1
