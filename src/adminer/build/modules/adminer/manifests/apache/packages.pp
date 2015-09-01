class adminer::apache::packages {
  package {[
      'apache2'
    ]:
    ensure => present
  }
}
