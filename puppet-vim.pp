# vim

# global var to put in a class
$username = "benoit"
case $operatingsystem {
  macosx: { $homedir = "/Users/$username" }
  ubuntu, debian: { $homedir = "/home/$username" }
}
$repodir = "$homedir/repo"


file { "$homedir/.vimrc":
	ensure 	=> 'link',
	target	=> "$homedir/repo/dotfiles/vimrc",
}
file { "$homedir/.vim":
	ensure 	=> 'link',
	target	=> "$homedir/repo/dotfiles/vim",
}
file { "$homedir/.vim-tmp":
  ensure  => 'directory',
}

