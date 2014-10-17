# -*- mode: ruby -*-
# vi: set ft=ruby :
Dotenv.load

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "centos6-virtualbox"

  config.vm.define "dbmaster" do |dbmaster|
    dbmaster.vm.hostname = "dbmaster"
    dbmaster.vm.network :private_network, ip: "192.168.33.10"
  end

  config.vm.define "dbslave" do |dbslave|
    dbslave.vm.hostname = "dbslave"
    dbslave.vm.network :private_network, ip: "192.168.33.11"
  end

    config.vm.provider :virtualbox do |v|
      v.name = config.vm.hostname
      v.customize ['modifyvm', :id, '--memory', '1024']
      v.customize ['modifyvm', :id, '--cpus',      '1']
      v.gui = true
    end

  config.vm.provision :shell, :path => "chef_inst.sh"
#  config.vm.provision :shell, :path => "repo_base.sh"
#  config.vm.provision :shell, :path => "repo_epel.sh"
#  config.vm.provision :shell, :path => "repo_remi.sh"
  config.vm.provision :shell, :path => "git_proxy.sh"
#  config.vm.provision :shell, :path => "env_proxy.sh"
  
  #inline: 'sudo rpm -ihv http://192.168.1.140/vmshare/chef-11.16.2-1.el6.x86_64.rpm'
  #inline: 'curl -L https://www.opscode.com/chef/install.sh | sudo bash'

  config.vm.provision :chef_solo do |chef|
    chef.log_level = :debug
    chef.cookbooks_path = ["./cookbooks", "./site-cookbooks"]
    chef.json = {
      mysql: {
        server_root_password: 'rootpass'
      }
    }
    chef.run_list = %w[
      recipe[mysql]
    ]
  end
end
