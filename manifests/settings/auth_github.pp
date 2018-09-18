# Class: grafana::settings::auth_github
class grafana::settings::auth_github (
  Optional[Boolean] $enabled = undef,
  Optional[Boolean] $allow_sign_up = undef,
  Optional[String] $client_id = undef,
  Optional[String] $client_secret = undef,
  Optional[String] $scopes = undef,
  Optional[String] $auth_url = undef,
  Optional[String] $token_url = undef,
  Optional[String] $api_url = undef,
  Optional[String] $team_ids = undef,
  Optional[String] $allowed_organizations = undef,
) {
  $settings = {
    'enabled'               => $enabled,
    'allow_sign_up'         => $allow_sign_up,
    'client_id'             => $client_id,
    'client_secret'         => $client_secret,
    'scopes'                => $scopes,
    'auth_url'              => $auth_url,
    'token_url'             => $token_url,
    'api_url'               => $api_url,
    'team_ids'              => $team_ids,
    'allowed_organizations' => $allowed_organizations,
  }

  ::grafana::settings { 'auth.github': settings => $settings }
}
