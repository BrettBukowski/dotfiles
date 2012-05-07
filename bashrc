# PATH
PATH=$PATH:$HOME/bin

export LS_COLORS="no=00:fi=00:di=01;34:ln=01;31:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00"



# GIT
PS1='\n\w $(__git_ps1 " (%s)")\n\h\$ '

# Z
. ~/bin/z.sh

# Shell Functions
calc() {
  awk "BEGIN{ print $* }" ;
}
r() {
  chmod -R 777 * 
}
ra() {
  chmod -R 755 *
}
mkcd() {
  mkdir $1
  cd $1
}
cs(){
  grep "$1" --color=auto `find -type f -name "*" ! -name "*.test*" ! -name "*.#*" ! -name "*.*~" ! -name "*.bak" -print`
}
s() {
  grep -i "$1" --color=auto `find -type f -name "*" ! -name "*.test*" ! -name "*.#*" ! -name "*.*~" ! -name "*.bak" -print`
}
fs() {
  grep -i "$1" --color=auto `find -name "*.$2" ! -name "*.test*" ! -name "*.#*" ! -name "*.bak" ! -name "*.*~" -print`
}
fn() {
  grep -i "$1" --color=auto `find -name "$2" ! -name "*.test*" ! -name "*.#*" ! -name "*.bak" ! -name "*.*~" -print`
}
f() {
  find -name "*" -print | xargs -0 -l1 -i grep -i {} "$1"
}

# ls aliases
alias lal='ls -al'
alias ll='ls -l -h'
alias la='ls -a'
alias lh='ls -a | egrep "^\."'
alias ps="ps gauxw"
alias ldir='ls -F|grep /'
alias ..="cd .." ...="cd ../.." ....="cd ../../.."