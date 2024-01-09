# Class: grafana::settings::users
class grafana::settings::users (
  Optional[Boolean] $allow_sign_up = undef,
  Optional[Boolean] $allow_org_create = undef,
  Optional[Boolean] $auto_assign_org = undef,
  Optional[String] $auto_assign_org_role = undef,
  Optional[String] $login_hint = undef,
  Optional[String] $default_theme = undef,
) {
  $settings = {
    'allow_sign_up'        => $allow_sign_up,
    'allow_org_create'     => $allow_org_create,
    'auto_assign_org'      => $auto_assign_org,
    'auto_assign_org_role' => $auto_assign_org_role,
    'login_hint'           => $login_hint,
    'default_theme'        => $default_theme,
  }

  ::grafana::settings { 'users': settings => $settings }
}
