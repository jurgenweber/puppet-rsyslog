define component_rsyslog::config (
  $ensure,
  $priority   = '10',
  $type       = 'facility', #can also be prefix
  $selector,
  $action,
  $discard    = true, #stop logging processing here
) {
 
  file { "${priority}_${selector}":
    ensure  => $ensure,
    path    => "/etc/rsyslog.d/${priority}-${selector}.conf",
    content => template("${module_name}/rsyslog.conf.erb"),
    notify  => Service['rsyslog'],
  } 

  if ! defined(Service['rsyslog']) {
    service { 'rsyslog':
      ensure  => running,
    }
  }
  
}
