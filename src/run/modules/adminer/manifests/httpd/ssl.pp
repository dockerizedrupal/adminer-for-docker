class adminer::httpd::ssl {
  exec { 'openssl genrsa -out /adminer/ssl/private/adminerCA.key 4096':
    timeout => 0,
    path => ['/usr/bin']
  }

  exec { "openssl req -x509 -new -nodes -key /adminer/ssl/private/adminerCA.key -days 365 -subj /C=/ST=/L=/O=/CN=adminer -out /adminer/ssl/certs/adminerCA.crt":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /adminer/ssl/private/adminerCA.key 4096']
  }

  exec { 'openssl genrsa -out /adminer/ssl/private/adminer.key 4096':
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -x509 -new -nodes -key /adminer/ssl/private/adminerCA.key -days 365 -subj /C=/ST=/L=/O=/CN=adminer -out /adminer/ssl/certs/adminerCA.crt"]
  }

  $subj = "/C=/ST=/L=/O=/CN=$server_name"

  exec { "openssl req -new -key /adminer/ssl/private/adminer.key -subj $subj -out /adminer/ssl/certs/adminer.csr":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec['openssl genrsa -out /adminer/ssl/private/adminer.key 4096']
  }

  exec { "openssl x509 -req -in /adminer/ssl/certs/adminer.csr -CA /adminer/ssl/certs/adminerCA.crt -CAkey /adminer/ssl/private/adminerCA.key -CAcreateserial -out /adminer/ssl/certs/adminer.crt -days 365":
    timeout => 0,
    path => ['/usr/bin'],
    require => Exec["openssl req -new -key /adminer/ssl/private/adminer.key -subj $subj -out /adminer/ssl/certs/adminer.csr"]
  }
}
