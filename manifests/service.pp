# Class: grafana::service
class grafana::service {
  assert_private()

  service { $grafana::service_name:
    ensure => $grafana::service_ensure,
    enable => $grafana::service_enable,
  }
}
