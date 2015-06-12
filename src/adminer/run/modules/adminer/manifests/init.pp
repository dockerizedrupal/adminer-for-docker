class adminer {
  include adminer::httpd

  if $mysqld_host {
    file { '/var/www/index.php':
      ensure  => present,
      content => template('adminer/index.php.erb')
    }
  }
}
