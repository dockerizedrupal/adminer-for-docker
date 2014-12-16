class adminer {
  require adminer::php

  file { '/httpd/data/adminer.php':
    ensure => present,
    source => 'puppet:///modules/adminer/httpd/data/adminer.php'
  }

  file { '/httpd/data/index.php':
    ensure => present,
    source => 'puppet:///modules/adminer/httpd/data/index.php'
  }
}
