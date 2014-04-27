# install latest mono on Debian

$packagePath = "http://debian.meebey.net/experimental/mono"
$sourceFile = "/etc/apt/sources.list"

#file { "${sourceFile}":
    

notify {"grep -c '${packagePath}' ${sourceFile}":}

exec { "source packages":
    command => "sed -i '$ a \\\n\\\ndeb ${packagePath} /' ${sourceFile}",
    #command => "echo '\n\ndeb ${packagePath}' >> ${sourceFile}",
    path => "/bin",
    unless => "grep -c '${packagePath}' ${sourceFile}",
}

exec { "apt-get update":
    command => "/usr/bin/apt-get update",
    require => Exec["source packages"],
}

package { "mono-complete":
    ensure => "present",
    require => Exec["apt-get update"],
}
