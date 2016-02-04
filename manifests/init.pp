class perconarepo (
  # release repos
  $percona_release_baseurl  = $perconarepo::params::percona_release_baseurl,
  $percona_release_descr    = $perconarepo::params::percona_release_descr,
  $percona_release_enabled  = $perconarepo::params::percona_release_enabled,
  $percona_release_gpgcheck = $perconarepo::params::percona_release_gpgcheck,
  $percona_release_gpgkey   = $perconarepo::params::percona_release_gpgkey,

  $percona_release_noarch_baseurl  = $perconarepo::params::percona_release_noarch_baseurl,
  $percona_release_noarch_descr    = $perconarepo::params::percona_release_noarch_descr,
  $percona_release_noarch_enabled  = $perconarepo::params::percona_release_noarch_enabled,
  $percona_release_noarch_gpgcheck = $perconarepo::params::percona_release_noarch_gpgcheck,
  $percona_release_noarch_gpgkey   = $perconarepo::params::percona_release_noarch_gpgkey,

  $percona_release_source_baseurl  = $perconarepo::params::percona_release_source_baseurl,
  $percona_release_source_descr    = $perconarepo::params::percona_release_source_descr,
  $percona_release_source_enabled  = $perconarepo::params::percona_release_source_enabled,
  $percona_release_source_gpgcheck = $perconarepo::params::percona_release_source_gpgcheck,
  $percona_release_source_gpgkey   = $perconarepo::params::percona_release_source_gpgkey,

  # testing repos
  $percona_testing_baseurl  = $perconarepo::params::percona_testing_baseurl,
  $percona_testing_descr    = $perconarepo::params::percona_testing_descr,
  $percona_testing_enabled  = $perconarepo::params::percona_testing_enabled,
  $percona_testing_gpgcheck = $perconarepo::params::percona_testing_gpgcheck,
  $percona_testing_gpgkey   = $perconarepo::params::percona_testing_gpgkey,

  $percona_testing_noarch_baseurl  = $perconarepo::params::percona_testing_noarch_baseurl,
  $percona_testing_noarch_descr    = $perconarepo::params::percona_testing_noarch_descr,
  $percona_testing_noarch_enabled  = $perconarepo::params::percona_testing_noarch_enabled,
  $percona_testing_noarch_gpgcheck = $perconarepo::params::percona_testing_noarch_gpgcheck,
  $percona_testing_noarch_gpgkey   = $perconarepo::params::percona_testing_noarch_gpgkey,

  $percona_testing_source_baseurl  = $perconarepo::params::percona_testing_source_baseurl,
  $percona_testing_source_descr    = $perconarepo::params::percona_testing_source_descr,
  $percona_testing_source_enabled  = $perconarepo::params::percona_testing_source_enabled,
  $percona_testing_source_gpgcheck = $perconarepo::params::percona_testing_source_gpgcheck,
  $percona_testing_source_gpgkey   = $perconarepo::params::percona_testing_source_gpgkey,

  # experimental repos
  $percona_experimental_baseurl  = $perconarepo::params::percona_experimental_baseurl,
  $percona_experimental_descr    = $perconarepo::params::percona_experimental_descr,
  $percona_experimental_enabled  = $perconarepo::params::percona_experimental_enabled,
  $percona_experimental_gpgcheck = $perconarepo::params::percona_experimental_gpgcheck,
  $percona_experimental_gpgkey   = $perconarepo::params::percona_experimental_gpgkey,

  $percona_experimental_noarch_baseurl  = $perconarepo::params::percona_experimental_noarch_baseurl,
  $percona_experimental_noarch_descr    = $perconarepo::params::percona_experimental_noarch_descr,
  $percona_experimental_noarch_enabled  = $perconarepo::params::percona_experimental_noarch_enabled,
  $percona_experimental_noarch_gpgcheck = $perconarepo::params::percona_experimental_noarch_gpgcheck,
  $percona_experimental_noarch_gpgkey   = $perconarepo::params::percona_experimental_noarch_gpgkey,

  $percona_experimental_source_baseurl  = $perconarepo::params::percona_experimental_source_baseurl,
  $percona_experimental_source_descr    = $perconarepo::params::percona_experimental_source_descr,
  $percona_experimental_source_enabled  = $perconarepo::params::percona_experimental_source_enabled,
  $percona_experimental_source_gpgcheck = $perconarepo::params::percona_experimental_source_gpgcheck,
  $percona_experimental_source_gpgkey   = $perconarepo::params::percona_experimental_source_gpgkey,
) inherits  perconarepo::params {
  
  validate_string($percona_release_baseurl)
  validate_string($percona_release_descr)
  validate_bool($percona_release_enabled)
  validate_bool($percona_release_gpgcheck)
  validate_string($percona_release_gpgkey)

  validate_string($percona_release_noarch_baseurl)
  validate_string($percona_release_noarch_descr)
  validate_bool($percona_release_noarch_enabled)
  validate_bool($percona_release_noarch_gpgcheck)
  validate_string($percona_release_noarch_gpgkey)

  validate_string($percona_release_source_baseurl)
  validate_string($percona_release_source_descr)
  validate_bool($percona_release_source_enabled)
  validate_bool($percona_release_source_gpgcheck)
  validate_string($percona_release_source_gpgkey)


  if $::operatingsystem in ['RedHat', 'CentOS'] {

    yumrepo {'percona-release':
      baseurl  => $percona_release_baseurl,
      descr    => $percona_release_descr,
      enabled  => bool2num($percona_release_enabled),
      gpgcheck => bool2num($percona_release_gpgcheck),
      gpgkey   => $percona_release_gpgkey,
    }

    yumrepo {'percona-release-noarch':
      baseurl  => $percona_release_noarch_baseurl,
      descr    => $percona_release_noarch_descr,
      enabled  => bool2num($percona_release_noarch_enabled),
      gpgcheck => bool2num($percona_release_noarch_gpgcheck),
      gpgkey   => $percona_release_noarch_gpgkey,
    }

    yumrepo {'percona-release-source':
      baseurl  => $percona_release_source_baseurl,
      descr    => $percona_release_source_descr,
      enabled  => bool2num($percona_release_source_enabled),
      gpgcheck => bool2num($percona_release_source_gpgcheck),
      gpgkey   => $percona_release_source_gpgkey,
    }

    yumrepo {'percona-testing':
      baseurl  => $percona_testing_baseurl,
      descr    => $percona_testing_descr,
      enabled  => bool2num($percona_testing_enabled),
      gpgcheck => bool2num($percona_testing_gpgcheck),
      gpgkey   => $percona_testing_gpgkey,
    }

    yumrepo {'percona-testing-noarch':
      baseurl  => $percona_testing_noarch_baseurl,
      descr    => $percona_testing_noarch_descr,
      enabled  => bool2num($percona_testing_noarch_enabled),
      gpgcheck => bool2num($percona_testing_noarch_gpgcheck),
      gpgkey   => $percona_testing_noarch_gpgkey,
    }

    yumrepo {'percona-testing-source':
      baseurl  => $percona_testing_source_baseurl,
      descr    => $percona_testing_source_descr,
      enabled  => bool2num($percona_testing_source_enabled),
      gpgcheck => bool2num($percona_testing_source_gpgcheck),
      gpgkey   => $percona_testing_source_gpgkey,
    }

    yumrepo {'percona-experimental':
      baseurl  => $percona_experimental_baseurl,
      descr    => $percona_experimental_descr,
      enabled  => bool2num($percona_experimental_enabled),
      gpgcheck => bool2num($percona_experimental_gpgcheck),
      gpgkey   => $percona_experimental_gpgkey,
    }

    yumrepo {'percona-experimental-noarch':
      baseurl  => $percona_experimental_noarch_baseurl,
      descr    => $percona_experimental_noarch_descr,
      enabled  => bool2num($percona_experimental_noarch_enabled),
      gpgcheck => bool2num($percona_experimental_noarch_gpgcheck),
      gpgkey   => $percona_experimental_noarch_gpgkey,
    }

    yumrepo {'percona-experimental-source':
      baseurl  => $percona_experimental_source_baseurl,
      descr    => $percona_experimental_source_descr,
      enabled  => bool2num($percona_experimental_source_enabled),
      gpgcheck => bool2num($percona_experimental_source_gpgcheck),
      gpgkey   => $percona_experimental_source_gpgkey,
    }

    file {'/etc/pki/rpm-gpg/RPM-GPG-KEY-Percona':
      ensure => 'present',
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      source => 'puppet:///modules/perconarepo/RPM-GPG-KEY-Percona',
    }
  }
  else {
    fail ("operating system ${::operatingsystem} is not supported by perconarepo")
  }
}
