# Class: grafana::settings::emails
class grafana::settings::emails (
  Optional[Boolean] $welcome_email_on_sign_up = undef,
) {
  $settings = {
    'welcome_email_on_sign_up' => $welcome_email_on_sign_up,
  }

  grafana::settings { 'emails': settings => $settings }
}
