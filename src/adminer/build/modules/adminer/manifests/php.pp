class adminer::php {
  require adminer::php::packages

  file { '/etc/php5/apache2/php.ini':
    ensure => present,
    source => 'puppet:///modules/adminer/etc/php5/apache2/php.ini',
    mode => 644
  }
}
