# install nodejs backports. Not ready: simply add backports to sources.list. 

$packagePath = "deb http://debian.bhs.mirrors.ovh.net/debian wheezy-backports main"
$sourceFile = "/etc/apt/sources.list"

#file { "${sourceFile}":
    

#notify {"grep -c '${packagePath}' ${sourceFile}":}

exec { "source packages":
    command => "sed -i '$ a \\\n\\\n${packagePath}' ${sourceFile}",
    path => "/bin",
    unless => "grep -c '${packagePath}' ${sourceFile}",
}

#exec { "apt-get update":
    #command => "/usr/bin/apt-get update",
    #require => Exec["source packages"],
#}

#package { "mono-complete":
    #ensure => "present",
    #require => Exec["apt-get update"],
#}
