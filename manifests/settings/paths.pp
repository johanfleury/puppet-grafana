# Class: grafana::settings::paths
class grafana::settings::paths (
  Optional[String] $data = undef,
  Optional[String] $logs = undef,
  Optional[String] $plugins = undef,
  Optional[String] $provisioning = undef,
  Boolean          $manage_provisioning = true,
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
    $_provisioning = "${grafana::config_dir}/provisioning"
  }

  $_provisioning_dirs = prefix(
    ['', 'dashboards', 'datasources'], "${_provisioning}/"
  )

  file { $_provisioning_dirs:
    ensure  => directory,
    purge   => $manage_provisioning,
    recurse => true,
    force   => $manage_provisioning,
    owner   => $grafana::user,
    group   => $grafana::group,
    mode    => '0750',
  }
}
