class apache {
	service { "apache2":
		ensure => "running",
	}

	define loadmodule () {
		include apache
		exec { "/usr/sbin/a2enmod $name" :
			unless => "/bin/readlink -e /etc/apache2/mods-enabled/${name}.load",
			notify => Service[apache2]
		}
	}
}
