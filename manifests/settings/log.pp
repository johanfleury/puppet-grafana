# Class: grafana::settings::log
class grafana::settings::log (
  Optional[String] $mode = undef,
) {
  $settings = {
    'mode' => $mode,
  }

  grafana::settings { 'log': settings => $settings }
}
