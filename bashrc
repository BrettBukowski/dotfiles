# PATH
PATH=$PATH:$HOME/bin

export LS_COLORS="no=00:fi=00:di=01;34:ln=01;31:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00"

# GIT
. ~/bin/git-completion.bash
PS1='\n\w $(__git_ps1 " (%s)")\n\h\$ '

# Z
. ~/bin/z.sh

# Shell Functions
calc() {
  awk "BEGIN{ print $* }" ;
}
mkcd() {
  mkdir $1
  cd $1
}
cs(){
  grep "$1" --color=auto `find . -type f -name "*" ! -name "*.test*" ! -name "*.#*" ! -name "*.*~" ! -name "*.bak" -print`
}
s() {
  grep -i "$1" --color=auto `find . -type f -name "*" ! -name "*.test*" ! -name "*.#*" ! -name "*.*~" ! -name "*.bak" -print`
}
fs() {
  grep -i "$1" --color=auto `find . -name "*.$2" ! -name "*.test*" ! -name "*.#*" ! -name "*.bak" ! -name "*.*~" -print`
}
fn() {
  grep -i "$1" --color=auto `find . -name "$2" ! -name "*.test*" ! -name "*.#*" ! -name "*.bak" ! -name "*.*~" -print`
}

# cd to the path of the front Finder window
# via <http://brettterpstra.com/2013/02/09/quick-tip-jumping-to-the-finder-location-in-terminal/>
cdf() {
  target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
  if [ "$target" != "" ]; then
    cd "$target"; pwd
  else
    echo 'No Finder window found' >&2
  fi
}
# Select the current directory in launchbar, optionally a file
# via <http://brettterpstra.com/2013/03/14/more-command-line-handiness/>
lb() {
  if [[ $# = 1 ]]; then
    [[ -e "$(pwd)/$1" ]] && open "x-launchbar:select?file=$(pwd)/$1" || open "x-launchbar:select?file=$1"
  else
    open "x-launchbar:select?file=$(pwd)"
  fi
}
# batch change extension
chgext() {
  for file in *.$1 ; do mv $file `echo $file | sed "s/\(.*\.\)$1/\1$2/"` ; done
}

# Mac aliases
alias ql="qlmanage -p &>/dev/null"
alias pbgist='jist -Ppo'
alias f='open -a Finder ./'
alias showlib='chflags nohidden ~/Library'
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# aliases
alias r='chmod -R 777 *'
alias ra='chmod -R 755 *'
alias sudo='sudo env PATH=$PATH'
alias alert='~/bin/alert.sh $?'

# ls aliases
alias lal='ls -al'
alias ll='ls -l -h'
alias la='ls -a'
alias lh='ls -a | egrep "^\."'
alias ps="ps gauxw"
alias ldir='ls -F|grep /'
alias ..="cd .." ...="cd ../.." ....="cd ../../.."
