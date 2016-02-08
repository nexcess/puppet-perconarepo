class perconarepo::params {
  $percona_gpgkey = 'https://www.percona.com/downloads/RPM-GPG-KEY-percona'

  # the baseurl parameters are combined with $percona_url_prefix in init.pp to
  # form the url to download packages

  # release repos
  $percona_release_baseurl  = '/release/$releasever/RPMS/$basearch'
  $percona_release_descr    = 'Percona-Release YUM repository - $basearch'
  $percona_release_enabled  = true
  $percona_release_gpgcheck = true

  $percona_release_noarch_baseurl  = '/release/$releasever/RPMS/noarch'
  $percona_release_noarch_descr    = 'Percona-Release YUM repository - noarch'
  $percona_release_noarch_enabled  = true
  $percona_release_noarch_gpgcheck = true

  $percona_release_source_baseurl  = '/release/$releasever/SRPMS'
  $percona_release_source_descr    = 'Percona-Release YUM repository - Source packages'
  $percona_release_source_enabled  = false
  $percona_release_source_gpgcheck = true

  # testing repos
  $percona_testing_baseurl  = '/testing/$releasever/RPMS/$basearch'
  $percona_testing_descr    = 'Percona-Testing YUM repository - $basearch'
  $percona_testing_enabled  = false
  $percona_testing_gpgcheck = true

  $percona_testing_noarch_baseurl  = '/testing/$releasever/RPMS/noarch'
  $percona_testing_noarch_descr    = 'Percona-Testing YUM repository - noarch'
  $percona_testing_noarch_enabled  = false
  $percona_testing_noarch_gpgcheck = true

  $percona_testing_source_baseurl  = '/testing/$releasever/SRPMS'
  $percona_testing_source_descr    = 'Percona-Testing YUM repository - Source packages'
  $percona_testing_source_enabled  = false
  $percona_testing_source_gpgcheck = true

  # experimental repos
  $percona_experimental_baseurl  = '/experimental/$releasever/RPMS/$basearch'
  $percona_experimental_descr    = 'Percona-Experimental YUM repository - $basearch'
  $percona_experimental_enabled  = false
  $percona_experimental_gpgcheck = true

  $percona_experimental_noarch_baseurl  = '/experimental/$releasever/RPMS/noarch'
  $percona_experimental_noarch_descr    = 'Percona-Experimental YUM repository - noarch'
  $percona_experimental_noarch_enabled  = false
  $percona_experimental_noarch_gpgcheck = true

  $percona_experimental_source_baseurl  = '/experimental/$releasever/SRPMS'
  $percona_experimental_source_descr    = 'Percona-Experimental YUM repository - Source packages'
  $percona_experimental_source_enabled  = false
  $percona_experimental_source_gpgcheck = true
}
