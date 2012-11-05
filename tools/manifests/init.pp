class tools {
	package { "vim":
		ensure => "installed",
	}

	file { "/etc/vim/vimrc":
		ensure => file,
		mode => 774,
		source => "puppet:///modules/tools/vimrc",
	}
}
