class symfony2::setup {

    # Install some default packages
    #
    # Vim for editing
    # ACL for setfacl command (cache e log dirs)
    $default_packages = [ "vim", "acl", "php5-cli", "php5-curl", "php5-intl" ]
    package { $default_packages :
        ensure => present,
    }

    package { "git-core" :
        name => "git",
        ensure => present,
    }

    # Some usefull gems
    #
    # Compass for SASS (see 'assetic')

    $default_gems = [ "compass" ]
    package { $default_gems :
        ensure => present,
        provider => 'gem',
    }
}