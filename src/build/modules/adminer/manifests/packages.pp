class adminer::packages {
  exec { 'apt-get update':
    path => ['/usr/bin']
  }

  package {[
      'apache2'
    ]:
    ensure => present,
    require => Exec['apt-get update']
  }
}
