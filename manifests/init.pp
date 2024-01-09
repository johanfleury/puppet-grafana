# Class: grafana
class grafana (
  String $package_name,
  String $package_ensure,
  String $service_name,
  String $service_ensure,
  Boolean $service_enable,
  Stdlib::AbsolutePath $config_dir,
  String $user,
  String $group,
  Optional[Stdlib::AbsolutePath] $config_file = undef,
  Hash[String, Hash[String, Any]] $settings = {},
) {
  contain ::grafana::install
  contain ::grafana::config
  contain ::grafana::service

  Class['::grafana::install']
  -> Class['::grafana::config']
  ~> Class['::grafana::service']
}
