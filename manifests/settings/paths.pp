# Class: grafana::settings::paths
class grafana::settings::paths (
  Optional[String] $data = undef,
  Optional[String] $logs = undef,
  Optional[String] $plugins = undef,
  Optional[String] $provisioning = undef,
) {
  $settings = {
    'data'         => $data,
    'logs'         => $logs,
    'plugins'      => $plugins,
    'provisioning' => $provisioning,
  }

  grafana::settings { 'paths': settings => $settings }

  if $provisioning {
    $_provisioning = $provisioning
  } else {
    $_provisioning = "${grafana::config::directory}/provisioning"
  }

  $_provisioning_dirs = prefix(
    ['', 'dashboards', 'datasources'], "${_provisioning}/"
  )

  file { $_provisioning_dirs:
    ensure  => directory,
    purge   => true,
    recurse => true,
    force   => true,
    owner   => $grafana::user,
    group   => $grafana::group,
    mode    => '0750',
  }
}
