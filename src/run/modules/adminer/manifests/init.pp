class adminer {
  file { '/httpd/data/index.php':
    ensure => present,
    content => template('adminer/index.php.erb')
  }
}
