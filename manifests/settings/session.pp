# Class: grafana::settings::session
class grafana::settings::session (
  Optional[String] $provider = undef,
  Optional[String] $provider_config = undef,
  Optional[String] $cookie_name = undef,
  Optional[Boolean] $cookie_secure = undef,
  Optional[Integer] $session_life_time = undef,
) {
  $settings = {
    'provider'          => $provider,
    'provider_config'   => $provider_config,
    'cookie_name'       => $cookie_name,
    'cookie_secure'     => $cookie_secure,
    'session_life_time' => $session_life_time,
  }

  grafana::settings { 'session': settings => $settings }
}
