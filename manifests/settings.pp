# Defined type: grafana::settings
define grafana::settings (
  Hash $settings,
  String $section = $title,
) {
  $ini_defaults = {
    path => $grafana::config::file,
  }

  $_settings = delete_undef_values($settings)

  create_ini_settings({ $section => $_settings }, $ini_defaults)
}
