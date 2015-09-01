class adminer {
  include adminer::apache

  if $mysql_host {
    file { '/var/www/index.php':
      ensure  => present,
      content => template('adminer/index.php.erb')
    }
  }
}
