class openldap {
	package { "slapd":
		ensure => installed,
	}

	service { "slapd":
		ensure => running,
	}

	file { "/etc/ldap/slapd.d/cn=config/olcDatabase={1}hdb.ldif":
		ensure => file,
		source => "puppet:///modules/openldap/olcDatabase={1}hdb.ldif",
		owner => openldap,
		group => openldap,
		mode => 600,
		notify => Service["slapd"],
	}

	define schema($schema = $title, $number)
	{
		file { "/etc/ldap/slapd.d/cn=config/cn=schema/cn={${$number}}${$schema}.ldif":
			ensure => file,
			source => "puppet:///modules/openldap/schema/${$schema}.ldif",
			owner => openldap,
			group => openldap,
			mode => 600,
			notify => Service["slapd"],
		}
	}

	schema{ "core": number => 0 }
	schema{ "cosine": number => 1 }
	schema{ "nis": number => 2 }
	schema{ "inetorgperson": number => 3 }
	schema{ "dhcp": number => 4 }
	schema{ "dnszone": number => 5 }
	schema{ "fai": number => 6 }
	schema{ "gofax": number => 7 }
	schema{ "gofon": number => 8 }
	schema{ "gosystem": number => 9 }
	schema{ "goto-mime": number => 10 }
	schema{ "goto": number => 11 }
	schema{ "hdb": number => 12 }
	schema{ "nagios": number => 13 }
	schema{ "openssh-lpk": number => 14 }
	schema{ "openxchange": number => 15 }
	schema{ "phpgwaccount": number => 16 }
	schema{ "phpscheduleit": number => 17 }
	schema{ "pptp": number => 18 }
	schema{ "pureftpd": number => 19 }
	schema{ "rfc2739": number => 20 }
	schema{ "samba3": number => 21 }
	schema{ "sudo": number => 22 }
	schema{ "trust": number => 23 }
	schema{ "gosa-samba3": number => 24 }
	schema{ "goserver": number => 25 }
	schema{ "ldapns": number => 26 }
	schema{ "dyngroup": number => 27 }
}
