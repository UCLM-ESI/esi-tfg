# -*- mode: ruby -*-
# vi: set ft=ruby :

$bootstrap = <<SCRIPT
wget -O- https://uclm-arco.github.io/debian/key.asc | sudo apt-key add -
sudo echo "deb https://uclm-arco.github.io/debian/ sid main" > /etc/apt/sources.list.d/arco.list
sudo apt-get update
sudo apt-get install -y esi-tfg
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.define "jessie" do |debian|
    debian.vm.box = "debian/jessie64"
    debian.vm.provision "shell", inline: $bootstrap
  end

  config.vm.define "stretch" do |debian|
    debian.vm.box = "debian/stretch64"
    debian.vm.provision "shell", inline: $bootstrap
  end

  config.vm.define "zesty" do |ubuntu|
    ubuntu.vm.box = "ubuntu/zesty64"
    ubuntu.vm.provision "shell", inline: $bootstrap
  end

end
