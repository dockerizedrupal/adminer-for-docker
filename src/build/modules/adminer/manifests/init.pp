class adminer {
  require adminer::httpd

  file { '/var/www/index.php':
    ensure => present,
    source => 'puppet:///modules/adminer/var/www/index.php'
  }
}
