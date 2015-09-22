class adminer {
  include adminer::apache
  include adminer::php
  include adminer::timezone

  if $mysql_host {
    file { '/var/www/index.php':
      ensure  => present,
      content => template('adminer/index.php.erb')
    }
  }
}
