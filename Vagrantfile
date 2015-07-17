# -*- mode: ruby -*-
# vi: set ft=ruby :
 
# Load settings
personalization = File.expand_path("../provisioners/parameters", __FILE__)
load personalization
 
# Requierements
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

#
# Vagrant configure
#
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    nodes = [
        { name: $vm1_name, ip: $vm1_ip, mgmt_port: $vm1_port },
        { name: $vm1_name, ip: $vm2_ip, mgmt_port: $vm2_port },
        { name: $vm1_name, ip: $vm3_ip, mgmt_port: $vm3_port },
    ]

    nodes.each do |node|
        config.vm.define node[:name].to_sym do |rabbit_config|
            rabbit_config.vm.box = $box
            rabbit_config.vm.box_url = $box_url
            rabbit_config.vm.hostname = node[:name]
            rabbit_config.vm.synced_folder ".",  $vm_group, id: "vagrant-root", :nfs => true
            rabbit_config.vm.synced_folder "./", $vm_www_point, create: false, type: "nfs
            rabbit_config.vm.network :forwarded_port, guest: 15672, host: node[:mgmt_port]
            rabbit_config.vm.network :private_network, ip: node[:ip]
            rabbit_config.vm.provision :shell, :path => "provisioners/shell/bootstrap.sh"
        end
    end

end