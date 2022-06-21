# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "apopa/focal64"
  config.vm.hostname = "ansible"
  config.vm.provision "shell", path: "https://raw.githubusercontent.com/andrewpopa/bash-provisioning/main/terraform/latest.sh"
  config.vm.provision "shell", path: "pkg.sh"
  config.vm.network "public_network", ip: "192.168.178.60", bridge: "en8: USB 10/100/1000 LAN" # need to be changed according to local env
end