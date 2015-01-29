class adminer::httpd::ssl {
  exec { 'mkdir -p /adminer/ssl':
    path => ['/bin']
  }

  exec { 'mkdir -p /adminer/ssl/private':
    path => ['/bin'],
    require => Exec['mkdir -p /adminer/ssl']
  }

  exec { 'mkdir -p /adminer/ssl/certs':
    path => ['/bin'],
    require => Exec['mkdir -p /adminer/ssl/private']
  }

  file { '/root/opensslCA.cnf':
    ensure => present,
    content => template('adminer/opensslCA.cnf.erb'),
    require => Exec['mkdir -p /adminer/ssl/certs']
  }

  exec { 'openssl genrsa -out /adminer/ssl/private/adminerCA.key 4096':
    timeout => 0,
    path => ['/usr/bin'],
    require => File['/root/opensslCA.cnf']
  }

  exec { "openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /adminer/ssl/private/adminerCA.key -out /adminer/ssl/certs/adminerCA.crt":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /adminer/ssl/private/adminerCA.key 4096']
  }

  exec { 'openssl genrsa -out /adminer/ssl/private/adminer.key 4096':
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /adminer/ssl/private/adminerCA.key -out /adminer/ssl/certs/adminerCA.crt"]
  }

  file { '/root/openssl.cnf':
    ensure => present,
    content => template('adminer/openssl.cnf.erb'),
    require => Exec['openssl genrsa -out /adminer/ssl/private/adminer.key 4096']
  }

  exec { "openssl req -sha256 -new -config /root/openssl.cnf -key /adminer/ssl/private/adminer.key -out /adminer/ssl/certs/adminer.csr":
    timeout => 0,
    path => ['/usr/bin'],
    require => File['/root/openssl.cnf']
  }

  exec { "openssl x509 -req -sha256 -CAcreateserial -days 3650 -extensions v3_req -extfile /root/opensslCA.cnf -in /adminer/ssl/certs/adminer.csr -CA /adminer/ssl/certs/adminerCA.crt -CAkey /adminer/ssl/private/adminerCA.key -out /adminer/ssl/certs/adminer.crt":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -sha256 -new -config /root/openssl.cnf -key /adminer/ssl/private/adminer.key -out /adminer/ssl/certs/adminer.csr"]
  }
}
