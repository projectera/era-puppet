class pam {
	file { "/etc/nsswitch.conf":
		owner => root,
		group => root,
		mode => 644,
		source => "puppet:///modules/pam/nsswitch.conf",
	}
	
	file { "/etc/libnss-ldap.conf":
		owner => root,
		group => root,
		mode => 644,
		ensure => file,
		content => template("pam/libnss-ldap.conf.erb"),
	}
	
	file { "/etc/ldap.conf":
		owner => root,
		group => root,
		mode => 644,
		source => "puppet:///modules/pam/ldap.conf",
	}
	
	file { "/etc/pam.d/common-session":
		owner => root,
		group => root,
		mode => 644,
		source => "puppet:///modules/pam/common-session",
	}

	file { "/etc/pam.d/common-auth":
		owner => root,
		group => root,
		mode => 644,
		source => "puppet:///modules/pam/common-auth",
	}

	file { "/etc/pam_ldap.conf":
		owner => root,
		group => root,
		mode => 664,
		source => "puppet:///modules/pam/pam_ldap.conf",
	}

	package { "ldap-utils":
		ensure => "installed",
	}

	package { "libpam-ldap":
		ensure => "installed",
	}

	package { "libnss-ldap":
		ensure => "installed",
	}

	package { "sudo-ldap":
		ensure => "installed",
	}
}
