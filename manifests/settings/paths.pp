# Class: grafana::settings::paths
class grafana::settings::paths (
  Optional[String] $data = undef,
  Optional[String] $logs = undef,
  Optional[String] $plugins = undef,
) {
  $settings = {
    'data'    => $data,
    'logs'    => $logs,
    'plugins' => $plugins,
  }

  grafana::settings { 'paths': settings => $settings }
}
