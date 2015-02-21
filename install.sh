#!/bin/bash
############################
# From: https://github.com/michaeljsmalley/dotfiles
# .install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bash_profile bashrc gitconfig irbrc zshrc gemrc ghci"    # list of files/folders to symlink in homedir
binfiles="alert.sh"
platform=`uname -s`

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# create symlinks from homedir/bin to files in ~/dotfiles dir specified in $binfiles
for file in $binfiles; do
    echo "Creating symlink to $file in bin directory."
    splitter=(${file//\//})
    ln -s $dir/$file ~/bin/${splitter[1]}
done

if [[ $platform == "Darwin" ]]; then
  ./$dir/defaults
fi

curl -L http://install.ohmyz.sh | sh
