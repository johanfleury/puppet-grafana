require 'spec_helper'

describe 'grafana' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'with defaults for all parameters' do
        it { is_expected.to compile.with_all_deps }

        it do
          is_expected.to contain_class('grafana::install')
            .that_comes_before('Class[grafana::config]')
        end

        it do
          is_expected.to contain_class('grafana::config')
            .that_notifies('Class[grafana::service]')
        end

        it { is_expected.to contain_class('grafana::service') }

        # grafana::install
        it do
          is_expected.to contain_package('grafana')
            .with(
              'ensure' => 'present',
            )
        end

        # grafana::config
        it do
          is_expected.to contain_file('/etc/grafana')
            .with(
              'ensure'  => 'directory',
              'purge'   => true,
              'recurse' => true,
              'force'   => true,
              'owner'   => 'grafana',
              'group'   => 'grafana',
              'mode'    => '0750',
            )
        end

        it do
          is_expected.to contain_file('/etc/grafana/grafana.ini')
            .with(
              'ensure' => 'file',
              'owner'  => 'grafana',
              'group'  => 'grafana',
              'mode'   => '0640',
            )
        end

        # grafana::service
        it do
          is_expected.to contain_service('grafana-server')
            .with(
              'ensure' => 'running',
              'enable' => true,
            )
        end
      end

      context 'with a custom parameters' do
        let(:params) do
          {
            'package_name'   => 'custom-package',
            'package_ensure' => 'purged',
            'service_name'   => 'custom-service',
            'service_ensure' => 'stopped',
            'service_enable' => false,
            'config_dir'     => '/etc/foo',
            'user'           => 'custom-user',
            'group'          => 'custom-group',
          }
        end

        it { is_expected.to compile.with_all_deps }

        it do
          is_expected.to contain_class('grafana::install')
            .that_comes_before('Class[grafana::config]')
        end

        it do
          is_expected.to contain_class('grafana::config')
            .that_notifies('Class[grafana::service]')
        end

        it { is_expected.to contain_class('grafana::service') }

        # grafana::install
        it do
          is_expected.to contain_package('custom-package')
            .with(
              'ensure' => 'purged',
            )
        end

        # grafana::config
        it do
          is_expected.to contain_file('/etc/foo')
            .with(
              'ensure'  => 'directory',
              'purge'   => true,
              'recurse' => true,
              'force'   => true,
              'owner'   => 'custom-user',
              'group'   => 'custom-group',
              'mode'    => '0750',
            )
        end

        it do
          is_expected.to contain_file('/etc/foo/grafana.ini')
            .with(
              'ensure' => 'file',
              'owner'  => 'custom-user',
              'group'  => 'custom-group',
              'mode'   => '0640',
            )
        end

        # grafana::service
        it do
          is_expected.to contain_service('custom-service')
            .with(
              'ensure' => 'stopped',
              'enable' => false,
            )
        end
      end
    end
  end
end
