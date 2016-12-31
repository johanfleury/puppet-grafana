# Class: grafana::service
class grafana::service inherits grafana {
  assert_private()

  service { $grafana::service_name:
    ensure  => $grafana::service_ensure,
    enable  => $grafana::service_enable,
    require => File[$grafana::config_file],
  }
}
