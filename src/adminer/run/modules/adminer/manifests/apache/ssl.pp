class adminer::apache::ssl {
  bash_exec { 'mkdir -p /adminer/ssl': }

  bash_exec { 'mkdir -p /adminer/ssl/private':
    require => Bash_exec['mkdir -p /adminer/ssl']
  }

  bash_exec { 'mkdir -p /adminer/ssl/certs':
    require => Bash_exec['mkdir -p /adminer/ssl/private']
  }

  file { '/root/opensslCA.cnf':
    ensure => present,
    content => template('adminer/opensslCA.cnf.erb'),
    require => Bash_exec['mkdir -p /adminer/ssl/certs']
  }

  bash_exec { 'openssl genrsa -out /adminer/ssl/private/adminerCA.key 4096':
    timeout => 0,
    require => File['/root/opensslCA.cnf']
  }

  bash_exec { "openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /adminer/ssl/private/adminerCA.key -out /adminer/ssl/certs/adminerCA.crt":
    timeout => 0,
    require => Bash_exec['openssl genrsa -out /adminer/ssl/private/adminerCA.key 4096']
  }

  bash_exec { 'openssl genrsa -out /adminer/ssl/private/adminer.key 4096':
    timeout => 0,
    require => Bash_exec["openssl req -sha256 -x509 -new -days 3650 -extensions v3_ca -config /root/opensslCA.cnf -key /adminer/ssl/private/adminerCA.key -out /adminer/ssl/certs/adminerCA.crt"]
  }

  file { '/root/openssl.cnf':
    ensure => present,
    content => template('adminer/openssl.cnf.erb'),
    require => Bash_exec['openssl genrsa -out /adminer/ssl/private/adminer.key 4096']
  }

  bash_exec { "openssl req -sha256 -new -config /root/openssl.cnf -key /adminer/ssl/private/adminer.key -out /adminer/ssl/certs/adminer.csr":
    timeout => 0,
    require => File['/root/openssl.cnf']
  }

  bash_exec { "openssl x509 -req -sha256 -CAcreateserial -days 3650 -extensions v3_req -extfile /root/opensslCA.cnf -in /adminer/ssl/certs/adminer.csr -CA /adminer/ssl/certs/adminerCA.crt -CAkey /adminer/ssl/private/adminerCA.key -out /adminer/ssl/certs/adminer.crt":
    timeout => 0,
    require => Bash_exec["openssl req -sha256 -new -config /root/openssl.cnf -key /adminer/ssl/private/adminer.key -out /adminer/ssl/certs/adminer.csr"]
  }
}
