class autobuild {
	user { "autobuild":
		ensure => present,
		system => true,
		gid => "eras",
		home => "/var/lib/autobuild",
	}

	package { "mono-xbuild":
		ensure => installed,
	}

	package { "mono-dmcs":
		ensure => installed,
	}

	file { "/var/lib/autobuild":
		ensure => directory,
		owner => "autobuild",
		group => "eras",
		mode => 775,
		require => User["autobuild"],
	}

	file { "/var/lib/autobuild/.ssh":
		ensure => directory,
		owner => autobuild,
		group => eras,
		recurse => true,
		source => "puppet:///modules/autobuild/ssh",
		mode => 700,
		require => File["/var/lib/autobuild"],
	}

	file { "/opt/eras/autobuild":
		ensure => directory,
		owner => "autobuild",
		group => "eras",
		mode => 775,
		recurse => true,
		source => "puppet:///modules/autobuild/bin",
		require => File["/opt/eras"],
	}

	file { "/var/lib/autobuild/eras":
		ensure => directory,
		owner => "autobuild",
		group => "eras",
		mode => 664,
		require => File["/var/lib/autobuild"],
	}

	git::clone { "/var/lib/autobuild/eras":
		url => "git@bitbucket.org:thexa4/eraserver.git",
		user => autobuild,
		branch => "master",
		require => [ File["/var/lib/autobuild/eras"], File["/var/lib/autobuild/.ssh"] ],
	}

	file { "/var/lib/autobuild/eras/.git/hooks/post-merge":
		ensure => file,
		owner => autobuild,
		group => eras,
		mode => 775,
		source => "puppet:///modules/autobuild/post-merge",
		require => Git::Clone["/var/lib/autobuild/eras"],
	}

	file { "/etc/cron.d/autobuild":
		ensure => file,
		owner => root,
		group => root,
		mode => 664,
		source => "puppet:///modules/autobuild/cron",
	}
}
