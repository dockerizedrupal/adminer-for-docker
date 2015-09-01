class adminer::apache::supervisor {
  file { '/etc/supervisor/conf.d/apache.conf':
    ensure => present,
    source => 'puppet:///modules/adminer/etc/supervisor/conf.d/apache.conf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/apache_stdout.conf':
    ensure => present,
    source => 'puppet:///modules/adminer/etc/supervisor/conf.d/apache_stdout.conf',
    mode => 644
  }

  file { '/etc/supervisor/conf.d/apache_stderr.conf':
    ensure => present,
    source => 'puppet:///modules/adminer/etc/supervisor/conf.d/apache_stderr.conf',
    mode => 644
  }
}
