#
#
#
class rsyslog::params {
  case $::operatingsystem {
    'FreeBSD': {
      $service_name = 'syslogd'
      $config_dir   = '/etc/syslog.d'
    }
    /^(Debian|Ubuntu|Raspbian)$/:{
      $service_name = 'rsyslog'
      $config_dir   = '/etc/rsyslog.d'
    }
  }
}

