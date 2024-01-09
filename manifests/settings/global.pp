# Class: grafana::settings::global
class grafana::settings::global (
  Optional[String] $app_mode = undef,
  Optional[String] $instance_name = undef,
) {
  $settings = {
    'app_mode'      => $app_mode,
    'instance_name' => $instance_name,
  }

  ::grafana::settings { 'global':
    section  => '',
    settings => $settings,
  }
}
