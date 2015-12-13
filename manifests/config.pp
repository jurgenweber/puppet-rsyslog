#
#
#
define rsyslog::config (
  $ensure,
  $priority   = '10',
  $type       = 'facility', #can also be prefix or programname
  $selector,
  $action,
  $discard    = true, #stop logging processing here
) {

  include rsyslog
  include rsyslog::params
  include rsyslog::service

  file { "${priority}_${selector}":
    ensure  => $ensure,
    path    => "${rsyslog::config_dir}/${priority}-${selector}.conf",
    content => template("${module_name}/rsyslog.conf.erb"),
    notify  => Service[$rsyslog::service_name],
  }

}
