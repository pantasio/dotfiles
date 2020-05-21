# Getting started  
If you're starting from scratch, go ahead and…  
* create a .dotfiles folder, which we'll use to track your dotfiles  
```
git init --bare $HOME/.dotfiles
```
* create an alias *dotfiles* so you don't need to type it all over again  
```
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
* set git status to hide untracked files  
```
df config --local status.showUntrackedFiles no
df remote add origin https://github.com/pantasio/dotfiles.git  
```
* add the alias to .bashrc (or .zshrc or fish) so you can use it later
```fish
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

# Setup environment in a new computer
Make sure to have git installed, then:  

* clone your github repository  
```
git clone --bare https://github.com/pantasio/dotfiles.git $HOME/.dotfiles
```

df checkout

<!-- Fix Error: -->

mkdir ~/tmpdotfiles
mv all error file to tmpdotfiles and then run df checkout again

rm -r tmpdotfiles  

<!-- Awesome! You’re done.   -->

* define the alias in the current shell scope  

```
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
* checkout the actual content from the git repository to your $HOME  
```
df checkout
```
Awesome! You’re done.  
