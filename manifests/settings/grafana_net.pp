# Class: grafana::settings::grafana_net
class grafana::settings::grafana_net (
  Optional[Stdlib::Httpurl] $url = undef,
) {
  $settings = {
    'url' => $url,
  }

  grafana::settings { 'grafana_net': settings => $settings }
}
