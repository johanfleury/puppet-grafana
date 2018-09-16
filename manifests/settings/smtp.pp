# Class: grafana::settings::smtp
class grafana::settings::smtp (
  Optional[Boolean] $enabled = undef,
  Optional[String] $host = undef,
  Optional[String] $user = undef,
  Optional[String] $password = undef,
  Optional[String] $cert_file = undef,
  Optional[String] $key_file = undef,
  Optional[Boolean] $skip_verify = undef,
  Optional[String] $from_address = undef,
) {
  $settings = {
    'enabled'      => $enabled,
    'host'         => $host,
    'user'         => $user,
    'password'     => $password,
    'cert_file'    => $cert_file,
    'key_file'     => $key_file,
    'skip_verify'  => $skip_verify,
    'from_address' => $from_address,
  }

  ::grafana::settings { 'smtp': settings => $settings }
}
