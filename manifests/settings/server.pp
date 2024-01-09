# Class: grafana::settings::server
class grafana::settings::server (
  Optional[String] $protocol = undef,
  Optional[String] $http_addr = undef,
  Optional[Integer] $http_port = undef,
  Optional[String] $domain = undef,
  Optional[Boolean] $enforce_domain = undef,
  Optional[String] $root_url = undef,
  Optional[Boolean] $router_logging = undef,
  Optional[String] $static_root_path = undef,
  Optional[Boolean] $enable_gzip = undef,
  Optional[String] $cert_file = undef,
  Optional[String] $cert_key = undef,
) {
  $settings = {
    'protocol'         => $protocol,
    'http_addr'        => $http_addr,
    'http_port'        => $http_port,
    'domain'           => $domain,
    'enforce_domain'   => $enforce_domain,
    'root_url'         => $root_url,
    'router_logging'   => $router_logging,
    'static_root_path' => $static_root_path,
    'enable_gzip'      => $enable_gzip,
    'cert_file'        => $cert_file,
    'cert_key'         => $cert_key,
  }

  ::grafana::settings { 'server': settings => $settings }
}
