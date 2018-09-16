# Class: grafana::settings::snapshots
class grafana::settings::snapshots (
  Optional[Boolean] $external_enabled = undef,
  Optional[String] $external_snapshot_url = undef,
  Optional[String] $external_snapshot_name = undef,
) {
  $settings = {
    'external_enabled'       => $external_enabled,
    'external_snapshot_url'  => $external_snapshot_url,
    'external_snapshot_name' => $external_snapshot_name,
  }

  ::grafana::settings { 'snapshots': settings => $settings }
}
