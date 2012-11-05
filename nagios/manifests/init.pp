class nagios {
	package { "nagios3":
		ensure => "installed",
	}

	service { "nagios3":
		ensure => "running",
		require => Package["nagios3"],
	}
	
	file { "/opt/max":
		ensure => "directory",
		mode => 775,
	}

	file { "/opt/max/nagios":
		ensure => directory,
		mode => 775,
		require => File["/opt/max"],
	}

	file { "/opt/max/nagios/plugins":
		ensure => directory,
		mode => 775,
		recurse => true,
		source => "puppet:///modules/nagios/plugins",
		require => File["/opt/max/nagios"],
	}

	file { "/opt/max/nagios/ldap2contactgroups":
		ensure => file,
		mode => 774,
		source => "puppet:///modules/nagios/ldap2contactgroups",
		require => File["/opt/max/nagios"],
	}

	file { "/opt/max/nagios/ldap2contacts":
		ensure => file,
		mode => 774,
		source => "puppet:///modules/nagios/ldap2contacts",
		require => File["/opt/max/nagios"],
	}

	file { "/opt/max/nagios/ldap2vps":
		ensure => file,
		mode => 774,
		source => "puppet:///modules/nagios/ldap2vps",
		require => File["/opt/max/nagios"],
	}

	file { "/opt/max/nagios/ldap2nagios":
		ensure => file,
		mode => 774,
		source => "puppet:///modules/nagios/ldap2nagios",
		require => File["/opt/max/nagios"],
	}

	file { "/etc/cron.hourly/ldap2nagios":
		ensure => link,
		target => "/opt/max/nagios/ldap2nagios",
	}

	file { "/etc/nagios3/conf.d/contactgroups":
		ensure => directory,
		mode => 775,
		require => Package["nagios3"],
	}

	file { "/etc/nagios3/conf.d/contacts":
		ensure => directory,
		mode => 775,
		require => Package["nagios3"],
	}

	file { "/etc/nagios3/nagios.cfg":
		ensure => file,
		mode => 664,
		source => "puppet:///modules/nagios/nagios.cfg",
		require => Package["nagios3"],
		notify => Service["nagios3"],
	}

	file { "/etc/nagios3/apache2.conf":
		ensure => file,
		mode => 644,
		source => "puppet:///modules/nagios/apache2.conf",
		require => Package["nagios3"],
		notify => Service["apache2"],
	}

	apache::loadmodule { "authnz_ldap": }

	file { "/etc/nagios3/conf.d/checks":
		ensure => directory,
		mode => 775,
		recurse => true,
		source => "puppet:///modules/nagios/checks",
		notify => Service["nagios3"],
	}
}
