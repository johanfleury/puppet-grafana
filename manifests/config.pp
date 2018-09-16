# Class: grafana::config
class grafana::config {
  assert_private()

  $directory = $::grafana::config_dir

  if $::grafana::config_file {
    deprecation(
      'grafana::config_file',
      'This setting is deprecated and will be removed in future release.'
    )
    $file = $::grafana::config_file
  } else {
    $file = "${directory}/grafana.ini"
  }

  file { $directory:
    ensure  => directory,
    purge   => true,
    recurse => true,
    force   => true,
    owner   => $::grafana::user,
    group   => $::grafana::group,
    mode    => '0750',
  }

  file { $file:
    ensure => file,
    owner  => $::grafana::user,
    group  => $::grafana::group,
    mode   => '0640',
  }

  $::grafana::settings.each |$section, $params| {
    $_section = regsubst($section, '\.', '_', 'G')

    create_resources('class', {"::grafana::settings::${_section}" => $params})
  }
}
