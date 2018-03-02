# Class: grafana::install
class grafana::install {
  assert_private()

  package { $grafana::package_name:
    ensure => $grafana::package_ensure,
  }
}
