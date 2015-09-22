class adminer::php::ini::max_execution_time {
  file { '/etc/php5/apache2/conf.d/max_execution_time.ini':
    ensure => present,
    content => template('adminer/php/ini/max_execution_time.ini.erb'),
    mode => 644
  }
}
