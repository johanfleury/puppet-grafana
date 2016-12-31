require 'spec_helper'

describe 'grafana' do
  context 'with defaults for all parameters' do
    it { is_expected.to compile.with_all_deps }

    it { is_expected.to contain_class('grafana') }
    it { is_expected.to contain_class('grafana::params') }
    it { is_expected.to contain_class('grafana::install') }
    it { is_expected.to contain_class('grafana::config') }
    it { is_expected.to contain_class('grafana::service') }
  end
end
