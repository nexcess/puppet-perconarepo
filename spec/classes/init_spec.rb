require 'spec_helper'

describe 'perconarepo' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        it { should contain_class('perconarepo') }
        it { should contain_class('perconarepo::params') }

        # release repos
        it do
          should contain_yumrepo('percona-release').with(
            'baseurl'  => 'http://repo.percona.com/release/$releasever/RPMS/$basearch',
            'descr'    => 'Percona-Release YUM repository - $basearch',
            'enabled'  => '1',
            'gpgcheck' => '1',
            'gpgkey'   => 'https://www.percona.com/downloads/RPM-GPG-KEY-percona',
          )
        end
        it do
          should contain_yumrepo('percona-release-noarch').with(
            'baseurl'  => 'http://repo.percona.com/release/$releasever/RPMS/noarch',
            'descr'    => 'Percona-Release YUM repository - noarch',
            'enabled'  => '1',
            'gpgcheck' => '1',
            'gpgkey'   => 'https://www.percona.com/downloads/RPM-GPG-KEY-percona',
          )
        end
        it do
          should contain_yumrepo('percona-release-source').with(
            'baseurl'  => 'http://repo.percona.com/release/$releasever/SRPMS',
            'descr'    => 'Percona-Release YUM repository - Source packages',
            'enabled'  => '0',
            'gpgcheck' => '1',
            'gpgkey'   => 'https://www.percona.com/downloads/RPM-GPG-KEY-percona',
          )
        end

        # testing repos
        it do
          should contain_yumrepo('percona-testing').with(
            'baseurl'  => 'http://repo.percona.com/testing/$releasever/RPMS/$basearch',
            'descr'    => 'Percona-Testing YUM repository - $basearch',
            'enabled'  => '0',
            'gpgcheck' => '1',
            'gpgkey'   => 'https://www.percona.com/downloads/RPM-GPG-KEY-percona',
          )
        end
        it do
          should contain_yumrepo('percona-testing-noarch').with(
            'baseurl'  => 'http://repo.percona.com/testing/$releasever/RPMS/noarch',
            'descr'    => 'Percona-Testing YUM repository - noarch',
            'enabled'  => '0',
            'gpgcheck' => '1',
            'gpgkey'   => 'https://www.percona.com/downloads/RPM-GPG-KEY-percona',
          )
        end
        it do
          should contain_yumrepo('percona-testing-source').with(
            'baseurl'  => 'http://repo.percona.com/testing/$releasever/SRPMS',
            'descr'    => 'Percona-Testing YUM repository - Source packages',
            'enabled'  => '0',
            'gpgcheck' => '1',
            'gpgkey'   => 'https://www.percona.com/downloads/RPM-GPG-KEY-percona',
          )
        end

        # experimental repos
        it do
          should contain_yumrepo('percona-experimental').with(
            'baseurl'  => 'http://repo.percona.com/experimental/$releasever/RPMS/$basearch',
            'descr'    => 'Percona-Experimental YUM repository - $basearch',
            'enabled'  => '0',
            'gpgcheck' => '1',
            'gpgkey'   => 'https://www.percona.com/downloads/RPM-GPG-KEY-percona',
          )
        end
        it do
          should contain_yumrepo('percona-experimental-noarch').with(
            'baseurl'  => 'http://repo.percona.com/experimental/$releasever/RPMS/noarch',
            'descr'    => 'Percona-Experimental YUM repository - noarch',
            'enabled'  => '0',
            'gpgcheck' => '1',
            'gpgkey'   => 'https://www.percona.com/downloads/RPM-GPG-KEY-percona',
          )
        end
        it do
          should contain_yumrepo('percona-experimental-source').with(
            'baseurl'  => 'http://repo.percona.com/experimental/$releasever/SRPMS',
            'descr'    => 'Percona-Experimental YUM repository - Source packages',
            'enabled'  => '0',
            'gpgcheck' => '1',
            'gpgkey'   => 'https://www.percona.com/downloads/RPM-GPG-KEY-percona',
          )
        end

        context 'custom parameters' do
          let(:params) do
            { :percona_url_prefix       => 'http://mirror.nexcess.net/percona',
              :percona_release_descr    => 'Mirror of the Percona-Release YUM repository',
              :percona_release_enabled  => false,
              :percona_release_gpgcheck => false,
              :percona_testing_enabled        => true,
              :percona_testing_noarch_enabled => true,
            }
          end
          it do
            should contain_yumrepo('percona-release').with(
              'baseurl'  => 'http://mirror.nexcess.net/percona/release/$releasever/RPMS/$basearch',
              'descr'    => 'Mirror of the Percona-Release YUM repository',
              'enabled'  => '0',
              'gpgcheck' => '0',
            )
          end

          it { should contain_yumrepo('percona-testing').with_enabled('1') }
          it { should contain_yumrepo('percona-testing-noarch').with_enabled('1') }
        end

      end
    end
  end
  context 'unsupported operating systems' do
    let(:facts) do
      { :operatingsystem => 'Debian'}
    end
    it do
      expect {
       catalogue
      }.to raise_error(Puppet::Error, /supported by perconarepo/)
    end
  end
end
