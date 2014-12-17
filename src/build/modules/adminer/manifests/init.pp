class adminer {
  require adminer::php
  require adminer::httpd

  file { '/adminer/data/adminer.php':
    ensure => present,
    source => 'puppet:///modules/adminer/adminer/data/adminer.php'
  }

  file { '/adminer/data/index.php':
    ensure => present,
    source => 'puppet:///modules/adminer/adminer/data/index.php'
  }
}
