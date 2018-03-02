# Class: grafana::settings::auth_ldap
class grafana::settings::auth_ldap (
  Optional[Boolean] $enabled = undef,
  Optional[Stdlib::Absolutepath] $config_file = undef,
) {
  $settings = {
    'enabled'     => $enabled,
    'config_file' => $config_file,
  }

  grafana::settings { 'auth.ldap': settings => $settings }

  file { $config_file:
    ensure => file,
    owner  => $grafana::user,
    group  => $grafana::group,
    mode   => '0640',
  }
}
