# Class: grafana::config
class grafana::config inherits grafana {
  assert_private()

  file { $grafana::config_dir:
    ensure  => directory,
    purge   => true,
    recurse => true,
    owner   => $grafana::user,
    group   => $grafana::group,
    mode    => '0750',
    require => Package[$grafana::package_name],
  }

  file { $grafana::config_file:
    ensure  => file,
    owner   => $grafana::user,
    group   => $grafana::group,
    mode    => '0640',
    require => File[$grafana::config_dir],
    notify  => Service[$grafana::service_name],
  }
}
