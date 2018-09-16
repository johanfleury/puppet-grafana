# Class: grafana::settings::metrics
class grafana::settings::metrics (
  Optional[Boolean] $enabled = undef,
  Optional[Integer] $interval_seconds = undef,
) {
  $settings = {
    'enabled'          => $enabled,
    'interval_seconds' => $interval_seconds,
  }

  ::grafana::settings { 'metrics': settings => $settings }
}
