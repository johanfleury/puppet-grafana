# Class: grafana::settings::log_syslog
class grafana::settings::log_syslog (
  Optional[String] $level = undef,
  Optional[String] $format = undef,
  Optional[String] $network = undef,
  Optional[String] $address = undef,
  Optional[String] $facility = undef,
  Optional[String] $syslog_tag = undef,
) {
  $settings = {
    'level'      => $level,
    'format'     => $format,
    'network'    => $network,
    'address'    => $address,
    'facility'   => $facility,
    'tag'        => $syslog_tag,
  }

  ::grafana::settings { 'log.syslog': settings => $settings }
}
