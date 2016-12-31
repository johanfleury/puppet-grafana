# Defined type: grafana::settings
define grafana::settings (
  Hash $settings,
  String $section = $title,
) {
  $ini_defaults = {
    path    => $grafana::config_file,
    require => File[$grafana::config_file],
    notify  => Service[$grafana::service_name],
  }

  $_settings = delete_undef_values($settings)

  create_ini_settings({ $section => $_settings }, $ini_defaults)
}
