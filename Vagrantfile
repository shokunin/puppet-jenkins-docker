VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Java kills, so up memory/cpu
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.define "jenkins" do |server|
    server.vm.box = "ubuntu/trusty64"
    server.vm.host_name = 'jenkins'
    server.vm.network "forwarded_port", guest: 8500, host: 8500
    server.vm.network "forwarded_port", guest: 8080, host: 8080
    server.vm.synced_folder "puppet/modules", "/tmp/vagrant-puppet/puppet/modules"
    server.vm.provision :puppet do |puppet|
      puppet.hiera_config_path = "puppet/ext/hiera.yaml"
      puppet.manifests_path = "puppet/manifests"
      puppet.options = ["--modulepath", "/tmp/vagrant-puppet/puppet/modules", "--parser", "future"]
      puppet.manifest_file = "jenkins.pp"
    end
  end #server

end
