class adminer::httpd::packages {
  package {[
      'apache2'
    ]:
    ensure => present
  }
}
