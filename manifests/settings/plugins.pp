# Class: grafana::settings::plugins
class grafana::settings::plugins (
  Optional[String] $allow_loading_unsigned_plugins = undef,
) {
  $settings = {
    'allow_loading_unsigned_plugins'   => $allow_loading_unsigned_plugins,
  }

  grafana::settings { 'plugins': settings => $settings }
}
