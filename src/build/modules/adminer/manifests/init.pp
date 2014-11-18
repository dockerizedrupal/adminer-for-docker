class adminer {
  require adminer::httpd

  file { '/var/www/adminer.php':
    ensure => present,
    source => 'puppet:///modules/adminer/var/www/adminer.php'
  }
}
