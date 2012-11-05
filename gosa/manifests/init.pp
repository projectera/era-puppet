class gosa {
	package { "gosa":
		ensure => installed,
	}

	package { "gosa-plugin-nagios":
		ensure => installed,
	}

	package { "gosa-plugin-rolemanagement":
		ensure => installed,
	}

	package { "gosa-plugin-sudo":
		ensure => installed,
	}

	package { "gosa-plugin-systems":
		ensure => installed,
	}

	file { "/etc/gosa/gosa.conf":
		ensure => file,
		owner => root,
		group => www-data,
		mode => 640,
		source => "puppet:///modules/gosa/gosa.conf",
	}
}
