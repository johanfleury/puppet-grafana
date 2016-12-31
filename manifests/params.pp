# Class: grafana::params
class grafana::params {
  $package_name = 'grafana'
  $package_ensure = 'present'

  $service_name = 'grafana-server'
  $service_ensure = 'running'
  $service_enable = true

  $config_dir = '/etc/grafana'
  $config_file = "${config_dir}/grafana.ini"

  $user = 'grafana'
  $group = 'grafana'
}
