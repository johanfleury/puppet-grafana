# Class: grafana::settings::database
class grafana::settings::database (
  Optional[String] $type = undef,
  Optional[String] $host = undef,
  Optional[String] $dbname = undef,
  Optional[String] $user = undef,
  Optional[String] $password = undef,
  Optional[String] $ssl_mode = undef,
  Optional[String] $path = undef,
) {
  $settings = {
    'type'     => $type,
    'host'     => $host,
    'name'     => $dbname,
    'user'     => $user,
    'password' => $password,
    'ssl_mode' => $ssl_mode,
    'path'     => $path,
  }

  grafana::settings { 'database': settings => $settings }
}
