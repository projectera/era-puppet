class eras {
	group { "eras":
		ensure => present,
		system => true,
	}

	user { "eras":
		ensure => present,
		system => true,
		gid => "eras",
		home => "/var/lib/eras",
	}

	file { "/var/lib/eras":
		ensure => directory,
		mode => 775,
		owner => "eras",
		group => "eras",
		require => User["eras"],
	}

	file { "/opt/eras":
		ensure => directory,
		mode => 775,
		owner => "eras",
		group => "eras",
	}

	file { "/opt/eras/bin":
		ensure => directory,
		mode => 775,
		owner => eras,
		group => eras,
	}
}
