# -*- mode: ruby -*-
# vi: set ft=ruby :

$bootstrap = <<SCRIPT
wget -O- http://pike.esi.uclm.es/arco/key.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://pike.esi.uclm.es/arco sid main" > /etc/apt/sources.list.d/pike.list'

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
