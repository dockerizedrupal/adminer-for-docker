class adminer {
  require adminer::httpd::ssl

  file { '/adminer/data/index.php':
    ensure => present,
    content => template('adminer/index.php.erb')
  }
}
