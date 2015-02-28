# SICP Environment

This is my vagrant/puppet setup for studying [Structure and Interpretation of Computer Programs](http://mitpress.mit.edu/sicp/) aka *The Wizard Book*.

It's by definition an opinionated setup:

* Vim as an editor
* Vundle to manage Vim plugins
* Slimv for LISP intraction plugin for Vim
* Zsh as shell
* ~~Prezto~~ ohmyzsh for instantly awesome and fast Zsh
  - Couldn't find an easy way to install prezto module since it's not puplished in puppet forge. Will switch to prezto as soon as I can.

## Setup

Install git and vagrant for your os.

Clone the repository:

    git clone https://github.com/selimober/sicp

Launch the VM:

    cd sicp
    vagrant up

Ssh into it:

    vagrant ssh

Run byobou:

    byobou

Done.

To have an ideo of how to use vim for scheme, read the vim plugin tutorial:
    
    [Slimv Tutorial](http://kovisoft.bitbucket.org/tutorial.html)
