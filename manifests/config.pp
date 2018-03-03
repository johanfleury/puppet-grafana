# Class: grafana::config
class grafana::config {
  assert_private()

  file { $grafana::config_dir:
    ensure  => directory,
    purge   => true,
    recurse => true,
    force   => true,
    owner   => $grafana::user,
    group   => $grafana::group,
    mode    => '0750',
  }

  file { $grafana::config_file:
    ensure => file,
    owner  => $grafana::user,
    group  => $grafana::group,
    mode   => '0640',
  }

  # This is required to manage default provisioning directories even if
  # ::grafana::settings::paths is not called by the module's user.
  include ::grafana::settings::paths

  $grafana::settings.each |$section, $params| {
    $_section = regsubst($section, '\.', '_', 'G')

    create_resources('class', {"::grafana::settings::${_section}" => $params})
  }
}
