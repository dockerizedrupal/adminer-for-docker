class adminer::timezone {
  bash_exec { "timedatectl set-timezone $timezone": }
}
