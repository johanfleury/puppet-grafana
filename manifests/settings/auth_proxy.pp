# Class: grafana::settings::auth_proxy
class grafana::settings::auth_proxy (
  Optional[Boolean] $enabled = undef,
  Optional[String] $header_name = undef,
  Optional[String] $header_property = undef,
  Optional[Boolean] $auto_sign_up = undef,
) {
  $settings = {
    'enabled'         => $enabled,
    'header_name'     => $header_name,
    'header_property' => $header_property,
    'auto_sign_up'    => $auto_sign_up,
  }

  grafana::settings { 'auth.proxy': settings => $settings }
}
