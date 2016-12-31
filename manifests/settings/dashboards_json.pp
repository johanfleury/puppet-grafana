# Class: grafana::settings::dashboards_json
class grafana::settings::dashboards_json (
  Optional[Boolean] $enabled = undef,
  Optional[String] $path = undef,
) {
  $settings = {
    'enabled' => $enabled,
    'path'    => $path,
  }

  grafana::settings { 'dashboards.json': settings => $settings }
}
