# Class: grafana::settings::analytics
class grafana::settings::analytics (
  Optional[Boolean] $reporting_enabled = undef,
  Optional[Boolean] $check_for_updates = undef,
  Optional[String] $google_analytics_ua_id = undef,
) {
  $settings = {
    'reporting_enabled'      => $reporting_enabled,
    'check_for_updates'      => $check_for_updates,
    'google_analytics_ua_id' => $google_analytics_ua_id,
  }

  ::grafana::settings { 'analytics': settings => $settings }
}
