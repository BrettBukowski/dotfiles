# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="subl ~/.zshrc"
# alias ohmyzsh="subl ~/.oh-my-zsh"

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
plugins=(git dircycle history-substring-search last-working-dir git-extras wd gitignore z zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export PATH=/opt/local/sbin
PATH=/opt/local/bin:$PATH
PATH=/opt/airbnb/bin:$PATH
PATH=/usr/X11/bin:$PATH
PATH=/usr/sbin:$PATH
PATH=/sbin:$PATH
PATH=/bin:$PATH
PATH=/usr/bin:$PATH
PATH=/usr/local/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=/Users/brettbukowski/bin:$PATH
PATH=/Users/brett_bukowski/Library/Python/3.8/bin:$PATH
PATH=$PATH:$HOME/src/optica_tools

# export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME=$(/usr/libexec/java_home -v11.0)
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export ANDROID_NDK="$ANDROID_HOME/ndk-bundle"

if [ -f ~/dotfiles/bashrc ]; then
   source ~/dotfiles/bashrc
fi

# if [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
#   source /usr/local/opt/chruby/share/chruby/chruby.sh
#   source /usr/local/opt/chruby/share/chruby/auto.sh
#   chruby ruby-2.3.1
# fi

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt AUTO_CD

unsetopt correct_all

# AIRLAB-DO-NOT-MODIFY section:ShellWrapper {{{
# Airlab will only make edits inside these delimiters.

# Source Airlab's shell integration, if it exists.
if [ -e ~/.airlab/shellhelper.sh ]; then
  source ~/.airlab/shellhelper.sh
fi
# AIRLAB-DO-NOT-MODIFY section:ShellWrapper }}}

# afdev
export DATA_DIR=$HOME/src/data #PATH WHERE YOU CLONED THE DATA REPO
export AFDEV_HOST="i-0b9ef73bb3e640713.inst.aws.airbnb.com" #CHOOSE A DIFFERENT HOST
export AFDEV_PORT=65005
export AFDEV_USER=brett_bukowski

export K2=y

eval "$(rbenv init -)"

gdf() {
  git diff --name-only $(git merge-base HEAD origin/master)
}

gdfsa() {
  echo "git diff files spotless apply"
  echo "Make sure you are in root directory!"
  local HELLO=0
  gdf | while read line ; do
    echo "Reformatting:" $line
    java -jar ~/Downloads/google-java-format-1.7-all-deps.jar -r $line
  done
}

tryy() {
	git add .
	git commit -m "wip"
	git push
  sleep 5
	of link airflow/teams/growth_seo/projects/poi_tips
  sleep 2
	of run poi_tips populate_tips_for_pois -e 2020-10-13
	of logs; alert
}


export AIRLAB_HOST="i-0d476fb28b46ca918.inst.aws.us-east-1.prod.musta.ch"
export LDAP_NAME="brett_bukowski"
export LOCAL_VIADUCT_ROOT="/Users/brett_bukowski/airlab/repos/treehouse/projects/viaduct/services/viaduct"

rbuild() {
    local AIRLAB_INSTANCE=$AIRLAB_HOST
    local REMOTE_VIADUCT_ROOT="~/repos/treehouse/projects/viaduct/services/viaduct"
    lab ssh -p '~/repos/treehouse/gradlew :projects:viaduct:services:viaduct:shadowJar'
    cd $LOCAL_VIADUCT_ROOT
    ((mkdir -p $LOCAL_VIADUCT_ROOT/build/libs) &&
         scp $LDAP_NAME@$AIRLAB_INSTANCE:$REMOTE_VIADUCT_ROOT/build/libs/viaduct-all.jar $LOCAL_VIADUCT_ROOT/build/libs
    )
}


rrun() {
    (rbuild &&
         java  "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=38587" -jar $LOCAL_VIADUCT_ROOT/build/libs/viaduct-all.jar server $LOCAL_VIADUCT_ROOT/viaduct.local.yml
    ) || echo "build failed"
}

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init --path)"


# begin pineapple block
source /Users/brett_bukowski/airlab/repos/pineapple/frontend/pineapple/scripts/shellhelper.sh
# end pineapple block
