# bash

// global var to put in a class
$username = "benoit"
case $operatingsystem {
  macosx: { $homedir = "/Users/$username" }
  ubuntu, debian: { $homedir = "/home/$username" }
}
$repodir = "$homedir/repo"



file { "$homedir/.bashrc":
	ensure 	=> 'link',
	target	=> "$repodir/dotfiles/bashrc",
}
file { "$homedir/.bash_profile":
	ensure 	=> 'link',
	target	=> "$repodir/dotfiles/bash_profile",
}
