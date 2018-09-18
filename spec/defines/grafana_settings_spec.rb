require 'spec_helper'

describe 'grafana::settings' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'with empty settings' do
        let(:pre_condition) do
          "class { '::grafana': }"
        end

        let(:title) { 'foo' }
        let(:params) do
          {
            'settings' => {},
          }
        end

        it { is_expected.not_to compile }
      end

      context 'with an undef setting' do
        let(:pre_condition) do
          "class { '::grafana': }"
        end

        let(:title) { 'foo' }
        let(:params) do
          {
            'settings' => {
              'bar' => :undef,
            },
          }
        end

        it { is_expected.to compile.with_all_deps }

        it do
          is_expected.not_to contain_ini_setting('/etc/grafana/grafana.ini [foo] bar')
        end
      end

      context 'with non-empty settings' do
        let(:pre_condition) do
          "class { '::grafana': }"
        end

        let(:title) { 'foo' }
        let(:params) do
          {
            'settings' => {
              'bar' => 'baz',
            },
          }
        end

        it { is_expected.to compile.with_all_deps }

        it do
          is_expected.to contain_ini_setting('/etc/grafana/grafana.ini [foo] bar')
            .with(
              'path'    => '/etc/grafana/grafana.ini',
              'section' => 'foo',
              'setting' => 'bar',
              'value'   => 'baz',
            )
        end
      end

      context 'with non-empty settings and a custom section' do
        let(:pre_condition) do
          "class { '::grafana': }"
        end

        let(:title) { 'foo' }
        let(:params) do
          {
            'settings' => {
              'bar' => 'baz',
            },
            'section' => 'custom',
          }
        end

        it { is_expected.to compile.with_all_deps }

        it do
          is_expected.to contain_ini_setting('/etc/grafana/grafana.ini [custom] bar')
            .with(
              'path'    => '/etc/grafana/grafana.ini',
              'section' => 'custom',
              'setting' => 'bar',
              'value'   => 'baz',
            )
        end
      end

      context 'with non-empty settings and a custom config_dir' do
        let(:pre_condition) do
          "class { '::grafana':
             config_dir => '/etc/foo'
           }"
        end

        let(:title) { 'foo' }
        let(:params) do
          {
            'settings' => {
              'bar' => 'baz',
            },
          }
        end

        it { is_expected.to compile.with_all_deps }

        it do
          is_expected.to contain_ini_setting('/etc/foo/grafana.ini [foo] bar')
            .with(
              'path'    => '/etc/foo/grafana.ini',
              'section' => 'foo',
              'setting' => 'bar',
              'value'   => 'baz',
            )
        end
      end
    end
  end
end
