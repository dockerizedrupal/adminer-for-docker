class adminer::packages {
  package {[
      'php5',
      'php5-mysql'
    ]:
    ensure => present
  }
}
