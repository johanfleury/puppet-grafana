# Class: grafana::settings::log_console
class grafana::settings::log_console (
  Optional[String] $level = undef,
  Optional[String] $format = undef,
) {
  $settings = {
    'level'       => $level,
    'format'      => $format,
  }

  grafana::settings { 'log.console': settings => $settings }
}
