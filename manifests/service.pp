#
#
#
class rsyslog::service inherits rsyslog::params {

  service { $rsyslog::service_name:
    ensure => running,
  }

}
