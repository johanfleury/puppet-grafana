# Class: grafana::settings::log_file
class grafana::settings::log_file (
  Optional[String] $level = undef,
  Optional[String] $format = undef,
  Optional[Boolean] $log_rotate = undef,
  Optional[Integer] $max_lines = undef,
  Optional[Integer] $max_size_shift = undef,
  Optional[Boolean] $daily_rotate = undef,
  Optional[Integer] $max_days = undef,
) {
  $settings = {
    'level'          => $level,
    'format'         => $format,
    'log_rotate'     => $log_rotate,
    'max_lines'      => $max_lines,
    'max_size_shift' => $max_size_shift,
    'daily_rotate'   => $daily_rotate,
    'max_days'       => $max_days,
  }

  ::grafana::settings { 'log.file': settings => $settings }
}
