class mongo {
	package { "mongodb-server":
		ensure => "installed",
	}
}
