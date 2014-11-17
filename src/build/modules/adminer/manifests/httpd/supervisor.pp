class adminer::httpd::supervisor {
  file { '/etc/supervisor/conf.d/httpd.conf':
    ensure => present,
    source => 'puppet:///modules/adminer/etc/supervisor/conf.d/httpd.conf'
  }
}
