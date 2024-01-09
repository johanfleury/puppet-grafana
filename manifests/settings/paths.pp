# Class: grafana::settings::paths
class grafana::settings::paths (
  Optional[String]  $data = undef,
  Optional[String]  $logs = undef,
  Optional[String]  $plugins = undef,
  Optional[String]  $provisioning = undef,
  Optional[Boolean] $manage_provisioning = undef,
) {

  if $provisioning {
    $_provisioning = $provisioning
  } else {
    $_provisioning = "${::grafana::config::directory}/provisioning"
  }

  $settings = {
    'data'         => $data,
    'logs'         => $logs,
    'plugins'      => $plugins,
    'provisioning' => $_provisioning,
  }

  grafana::settings { 'paths': settings => $settings }

  $_provisioning_dirs = prefix(
    [
      '',
      'access-control',
      'alerting',
      'dashboards',
      'datasources',
      'notifiers',
      'plugins',
    ],
    "${_provisioning}/"
  )

  file { $_provisioning_dirs:
    ensure  => directory,
    purge   => $manage_provisioning,
    recurse => $manage_provisioning,
    force   => $manage_provisioning,
    owner   => 'root',
    group   => $grafana::group,
    mode    => '0755',
  }
}
