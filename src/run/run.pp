node default {
  if $db_host {
    include adminer
  }
}
