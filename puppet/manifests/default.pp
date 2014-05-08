node default {
    class { "symfony2":
        www_root => '/vagrant/app/web',
        www_user => 'vagrant',
        dbname => 'symfony2',
        dbuser => 'symfony2',
        dbpass => 'symfony2',
    }
}