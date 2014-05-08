class symfony2(
  $www_root = '/vagrant/app',
  $www_user = 'www-data',
  $hostname = 'localhost',
  $dbname = 'symfony2',
  $dbuser = 'symfony2',
  $dbpass = 'symfony2',
) {
  Exec {
    path => "/usr/bin",
  }

  exec { "apt-get update": }

  class { "symfony2::setup":
    require  => Exec["apt-get update"]
  }

  class { "symfony2::mysql":
    dbname => $dbname,
    dbuser => $dbuser,
    dbpass => $dbpass,
    require  => Exec["apt-get update"]
  }

  class { "symfony2::nginx":
    www_root => $www_root,
    hostname => $hostname,
    require => Exec["apt-get update"]
  }

  class { "symfony2::php":
    www_user => $www_user,
    require => Exec["apt-get update"]
  }
}
