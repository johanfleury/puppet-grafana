require 'spec_helper'

describe 'grafana::settings::auth_ldap' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      context 'with defaults for all parameters' do
        let(:pre_condition) do
          "class { '::grafana': }"
        end

        let(:params) do
          {
            'bind_dn' => 'foo',
          }
        end

        it do
          is_expected.to contain_grafana__settings('auth.ldap')
            .with(
              'settings' => {
                'enabled'     => true,
                'config_file' => '/etc/grafana/ldap.toml',
              },
            )
        end

        it do
          is_expected.to contain_file('/etc/grafana/ldap.toml')
            .with(
              'ensure' => 'file',
              'owner'  => 'grafana',
              'group'  => 'grafana',
              'mode'   => '0640',
            )
            .that_requires('Class[grafana::config]')
            .that_notifies('Class[grafana::service]')
            .with_content(
              '[[servers]]
host = "localhost"
port = 636
use_ssl = true
ssl_skip_verify = false
bind_dn = "foo"
search_filter = "(|(sAMAccountName=%s)(userPrincipalName=%s))"
search_base_dns = [""]

[servers.attributes]
name = "givenName"
surname = "sn"
username = "sAMAccountName"
member_of = "memberOf"
email = "email"

',
            )
        end
      end
    end
  end
end
