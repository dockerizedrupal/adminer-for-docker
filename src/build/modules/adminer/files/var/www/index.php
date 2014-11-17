<?php

function adminer_object() {
  class AdminerSoftware extends Adminer {

    function name() {
      // custom name in title and heading
      return 'Software';
    }

    function permanentLogin() {
      // key used for permanent login
      return "cc1399d182e200baeefee8320155b54f";
    }

    function credentials() {
      // server, username and password for connecting to database
      return array('localhost', 'ODBC', '');
    }

    function database() {
      // database name, will be escaped by Adminer
      return 'software';
    }

    function login($login, $password) {
      // validate user submitted credentials
      return ($login == 'admin' && $password == '');
    }

    function tableName($tableStatus) {
      // tables without comments would return empty string and will be ignored by Adminer
      return h($tableStatus["Comment"]);
    }

    function fieldName($field, $order = 0) {
      // only columns with comments will be displayed and only the first five in select
      return ($order <= 5 && !preg_match('~_(md5|sha1)$~', $field["field"]) ? h($field["comment"]) : "");
    }

  }

  return new AdminerSoftware;
}

include './adminer-4.1.0.php';
