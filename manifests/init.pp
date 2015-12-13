#
#
#
class rsyslog inherits rsyslog::params {

  if ($::operatingsystem == 'FreeBSD') {
    file { $rsyslog::config_dir:
      ensure => directory,
      mode   => '0755',
    }

    file { '/etc/syslog.conf':
      mode   => '0644',
      source => 'puppet:///modules/rsyslog/freebsd_syslog_conf',
      notify => Service[$rsyslog::service_name],
    }
  } else {
    file { $rsyslog::config_dir:
      ensure => directory,
      mode   => '0755',
    }
  }

}
