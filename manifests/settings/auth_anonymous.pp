# Class: grafana::settings::auth_anonymous
class grafana::settings::auth_anonymous (
  Optional[Boolean] $enabled = undef,
  Optional[String] $org_name = undef,
  Optional[String] $org_role = undef,
) {
  $settings = {
    'enabled'  => $enabled,
    'org_name' => $org_name,
    'org_role' => $org_role,
  }

  grafana::settings { 'auth.anonymous': settings => $settings }
}
