class nagios {
	package { "nagios3":
		ensure => "installed",
	}
	
	file { "/opt/max":
		ensure => "directory',
		mode => 775,
	}

	file { "/opt/max/ldap2contactgroups":
		ensure => file,
		mode => 774,
		source => "puppet:///modules/nagios/ldap2contactgroups",
	}

	file { "/opt/max/ldap2contacts":
		ensure => file,
		mode => 774,
		source => "puppet:///modules/nagios/ldap2contacts",
	}

	file { "/opt/max/ldap2vps":
		ensure => file,
		mode => 774,
		source => "puppet:///modules/nagios/ldap2vps",
	}

	file { "/opt/max/ldap2nagios":
		ensure => file,
		mode => 774,
		source => "puppet:///modules/nagios/ldap2nagios",
	}

	file { "/etc/cron.hourly/ldap2nagios":
		ensure => link,
		target => "/opt/max/ldap2nagios",
	}
}
