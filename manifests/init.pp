# Class: grafana
class grafana (
  String $package_name = $grafana::params::package_name,
  String $package_ensure = $grafana::params::package_ensure,

  String $service_name = $grafana::params::service_name,
  String $service_ensure = $grafana::params::service_ensure,
  Boolean $service_enable = $grafana::params::service_enable,

  Stdlib::AbsolutePath $config_dir = $grafana::params::config_dir,
  Stdlib::AbsolutePath $config_file = $grafana::params::config_file,

  String $user = $grafana::params::user,
  String $group = $grafana::params::group,

  Hash[String, Hash[String, Any]] $settings = {},
) inherits grafana::params {
  contain ::grafana::install
  contain ::grafana::config
  contain ::grafana::service

  Class['::grafana::install']
  -> Class['::grafana::config']
  ~> Class['::grafana::service']
}
