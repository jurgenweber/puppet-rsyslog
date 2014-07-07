a module to add rsyslog conf's to /etc/rsyslog.d/, could be fleshed out to a full rsyslog module... could be. :)

rsyslog::config { 'crons':
  ensure        => 'present|absent',
  priority      => '10',
  type          => 'facility'|'msg'|'programname',
  selector      => 'cron.*'|'IPTables'|'puppet-agent',
  action        => '/var/log/cron.log', 
  discard       => true|false,
}
