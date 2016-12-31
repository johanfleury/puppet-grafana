# Class: grafana::install
class grafana::install inherits grafana {
  assert_private()

  package { $grafana::package_name:
    ensure => $grafana::package_ensure,
  }
}
