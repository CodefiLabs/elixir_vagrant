# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "forwarded_port", guest: 4000, host: 4000
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "4096"
    vb.cpus = 8
  end
  config.vm.provision "shell", path: "bootstrap.sh"
  config.vm.synced_folder ".", "/opt/apps"
  config.vm.synced_folder ".", "/vagrant", disabled: true
end
