class puppet {
	service { "puppet":
		ensure => "running",
	}	

	file { "/etc/default/puppet" :
		ensure => file,
		mode => 644,
		source => "puppet:///modules/puppet/puppet",
	}
}
