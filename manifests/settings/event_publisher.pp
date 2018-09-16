# Class: grafana::settings::event_publisher
class grafana::settings::event_publisher (
  Optional[Boolean] $enabled = undef,
  Optional[String] $rabbitmq_url = undef,
  Optional[String] $exchange = undef,
) {
  $settings = {
    'enabled'      => $enabled,
    'rabbitmq_url' => $rabbitmq_url,
    'exchange'     => $exchange,
  }

  ::grafana::settings { 'event_publisher': settings => $settings }
}
