class adminer {
  file { '/var/www/index.php':
    ensure => present,
    content => template('adminer/index.php.erb')
  }
}
