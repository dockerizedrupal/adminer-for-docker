<?php

function adminer_object() {
  class AdminerSoftware extends Adminer {
    function credentials() {
      // server, username and password for connecting to database
      return array('localhost', 'ODBC', '');
    }
  }

  return new AdminerSoftware;
}

include './adminer-4.1.0.php';
