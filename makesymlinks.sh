#!/bin/bash
#########################
# .make.sh
# this script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
#########################

########## Variables

dir=~/dotfiles                   # dotfiles directory
olddir=~/dotfiles_old            # old dotfiles backup directory
files="xscreensaver bash_logout bashrc gitconfig gman profile tmux.conf xorg.conf"   # list of files/folders to symlink in homedir

###########

# create dotfiles_old in homedir
echo -n "Creating $olddir for back of any exisiting dotfiles in -..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfile from ~ to $olddir"
    mv ~/.file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.file
done



