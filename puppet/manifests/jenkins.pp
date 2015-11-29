hiera_include('classes', [])

exec { 'add_jenkins_to_docker':
  command => '/usr/sbin/usermod -a -G docker jenkins',
  require => Class['jenkins'],
  unless  => '/usr/bin/id jenkins | /bin/grep  -q docker'
}


class { '::consul':
  version              => '0.5.2',
  require => Class['unix_base', 'vagrant', 'ubuntu_pkgs'],
  config_hash          => {
    'bootstrap_expect' => 1,
    'client_addr'      => '0.0.0.0',
    'data_dir'         => '/opt/consul',
    'datacenter'       => 'vagrant',
    'log_level'        => 'INFO',
    'node_name'        => $::hostname,
    'server'           => true,
    'ui_dir'           => '/opt/consul/ui',
  }

}
