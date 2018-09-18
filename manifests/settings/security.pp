# Class: grafana::settings::security
class grafana::settings::security (
  Optional[String] $admin_user = undef,
  Optional[String] $admin_password = undef,
  Optional[String] $secret_key = undef,
  Optional[Integer] $login_remember_days = undef,
  Optional[String] $cookie_username = undef,
  Optional[String] $cookie_remember_name = undef,
  Optional[Boolean] $disable_gravatar = undef,
  Optional[String] $data_source_proxy_whitelist = undef,
) {
  $settings = {
    'admin_user'                  => $admin_user,
    'admin_password'              => $admin_password,
    'secret_key'                  => $secret_key,
    'login_remember_days'         => $login_remember_days,
    'cookie_username'             => $cookie_username,
    'cookie_remember_name'        => $cookie_remember_name,
    'disable_gravatar'            => $disable_gravatar,
    'data_source_proxy_whitelist' => $data_source_proxy_whitelist,
  }

  ::grafana::settings { 'security': settings => $settings }
}
