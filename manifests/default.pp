exec { "set local":
  command => "echo 'LC_ALL=\"en_US.UTF-8\"' >> /etc/environment",
  path => "/bin"
}

exec { "apt-get update":
  path => "/usr/bin",
  require => Exec["set local"]
}

package { "racket":
	ensure => "latest",
	require => Exec["apt-get update"]
}
