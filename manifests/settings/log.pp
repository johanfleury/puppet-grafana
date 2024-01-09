# Class: grafana::settings::log
class grafana::settings::log (
  Optional[String] $mode    = undef,
  Optional[String] $filters = undef,
) {
  $settings = {
    'mode'    => $mode,
    'filters' => $filter,
  }

  ::grafana::settings { 'log': settings => $settings }
}
