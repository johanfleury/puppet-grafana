# Class: grafana::settings::auth_basic
class grafana::settings::auth_basic (
  Optional[Boolean] $enabled = undef,
) {
  $settings = {
    'enabled' => $enabled,
  }

  grafana::settings { 'auth.basic': settings => $settings }
}
