# Class: grafana::settings::auth
class grafana::settings::auth (
  Boolean $disable_login_form = false,
) {
  $settings = {
    'disable_login_form' => $disable_login_form,
  }

  grafana::settings { 'auth': settings => $settings }
}
