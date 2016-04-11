# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box_check_update = false

  config.vm.define "cobbler" do |node|
    node.vm.hostname = "cobbler.local.xyz"
    node.vm.box = "trusty64"
    node.vm.provider :libvirt do |libvirt|
      libvirt.memory = 2048
      libvirt.cpus = 2
    end
    node.vm.network :private_network,
      :libvirt__network_name => "provisioning",
      :libvirt__netmask => "255.255.255.0",
      :libvirt__dhcp_enabled => false,
      :libvirt__forward_mode => "nat",
      ip: "192.168.66.4"
    node.vm.provision "shell", path: "setup-cobbler.sh"
  end
end
