class adminer {
  require adminer::php
  require adminer::httpd

  file { '/var/www/adminer.php':
    ensure => present,
    source => 'puppet:///modules/adminer/var/www/adminer.php'
  }

  file { '/var/www/index.php':
    ensure => present,
    source => 'puppet:///modules/adminer/var/www/index.php'
  }
}
