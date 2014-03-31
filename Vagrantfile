# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.box = "centos6.4puppet"
  
  config.vm.define "nodo_test" do |conf1|
    conf1.vm.hostname = "test"
    conf1.vm.network "public_network", ip: "10.192.104.97", :bridge => 'eth0'
    conf1.vm.provider "virtualbox" do |v|
      v.gui = false
      v.customize ["modifyvm", :id, "--memory", ENV['VM_MEMORY']]
      v.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end
  
  config.vm.define "nodo_certif" do |conf2|
    conf2.vm.hostname = "certif"
    conf2.vm.network "public_network", ip: "10.192.104.98", :bridge => 'eth0'
    conf2.vm.provider "virtualbox" do |v|
      v.gui = false
      v.customize ["modifyvm", :id, "--memory", ENV['VM_MEMORY']]
      v.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end
  
  config.vm.define "nodo_prod" do |conf3|
    conf3.vm.hostname = "prod"
    conf3.vm.network "public_network", ip: "10.192.104.99", :bridge => 'eth0'
    conf3.vm.provider "virtualbox" do |v|
      v.gui = false
      v.customize ["modifyvm", :id, "--memory", ENV['VM_MEMORY']]
      v.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end
  
  config.vm.provision :puppet do |puppet|
    puppet.module_path = "puppet/modules"
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "site.pp"
  end
  
end
