# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos_64_minimal"
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.synced_folder "~/Development/rakugaki", "/home/sandbox/rakugaki", owner: "sandbox", group: "sandbox"

  config.vm.provider "virtualbox" do |v|
    v.customize [ "modifyvm", :id, "--memory", "2048", "--cpus", "2"]
  end
end
