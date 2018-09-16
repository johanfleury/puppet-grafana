# Class: grafana::settings::auth_ldap
class grafana::settings::auth_ldap (
  Boolean                                            $enabled,
  Stdlib::Absolutepath                               $config_file,
  String                                             $bind_dn,
  Array[String]                                      $search_base_dns,
  Array[Stdlib::Host]                                $ldap_servers,
  Stdlib::Port                                       $port,
  Boolean                                            $use_ssl,
  Boolean                                            $ssl_skip_verify,
  String                                             $search_filter,
  Array[Grafana::Settings::Auth_ldap::Group_mapping] $group_mappings,
  Grafana::Settings::Auth_ldap::Server_attributes    $server_attributes,
  Optional[String]                                   $bind_password,
) {
  $settings = {
    'enabled'     => $enabled,
    'config_file' => $config_file,
  }

  ::grafana::settings { 'auth.ldap': settings => $settings }

  file {$config_file:
    ensure  => file,
    owner   => $::grafana::user,
    group   => $::grafana::group,
    mode    => '0640',
    content => template('grafana/etc/ldap.toml.erb'),
    notify  => Service[$grafana::service_name],
  }
}
