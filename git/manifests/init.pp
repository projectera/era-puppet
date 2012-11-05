class git {
	package { "git":
		ensure => installed,
	}

	define clone($url, $user, $branch="master")
	{
		exec { "Clone repo to $name":
			user => $user,
			command => "/usr/bin/git clone -b '$branch' '$url' '$name'",
			creates => "$name/.git",
		}
	}
}
