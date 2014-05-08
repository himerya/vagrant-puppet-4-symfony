class symfony2::php(
  $www_user = 'www-data',
) {
  package { "php5-fpm": }
  service { "php5-fpm":
    ensure     => "running",
    hasrestart => true,
    hasstatus  => true,
    require    => Package["php5-fpm"]
  }
  file { "/etc/php5/fpm/php.ini":
    content => template("symfony2/php.ini.erb"),
    require => Package["php5-fpm"],
    notify  => Service["php5-fpm"]
  }
  file { "/etc/php5/fpm/pool.d/www.conf":
    content => template("symfony2/www.conf.erb"),
    require => Package["php5-fpm"],
    notify  => Service["php5-fpm"]
  }
}
