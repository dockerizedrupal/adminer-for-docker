class adminer {
  require adminer::httpd::ssl

  if $db_host {
    file { '/adminer/data/index.php':
      ensure  => present,
      content => template('adminer/index.php.erb')
    }
  }
}
