# Class: grafana::config
class grafana::config {
  assert_private()

  file { $grafana::config_dir:
    ensure  => directory,
    purge   => true,
    recurse => true,
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

  $grafana::settings.each |$section, $params| {
    $_section = regsubst($section, '\.', '_', 'G')

    create_resources('class', {"::grafana::settings::${_section}" => $params})
  }
}
