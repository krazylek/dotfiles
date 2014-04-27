# system utilities

$utilities = ["curl", "exuberant-ctags", "ack-grep"]
package { $utilities: ensure => "installed" }
