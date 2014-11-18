node default {
  if $db_server {
    include adminer
  }
}
