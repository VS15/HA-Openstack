# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu-14.04.box"
  # If you run into issues with Ansible complaining about executable permissions,
  # comment the following statement and uncomment the next one.
  config.vm.synced_folder ".", "/vagrant"
  # config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
  config.vm.define :haproxy1, primary: true do |haproxy1|
    haproxy1.vm.network "private_network", ip: "192.168.1.30"
    haproxy1.vm.hostname = "haproxy1"
    haproxy1.vm.provision "shell", path: "ansiblestrap.sh"
    haproxy1.vm.provision :shell, inline: 'ansible-playbook /vagrant/ansible/ha-ltm.yml -c local -v'
  end
  config.vm.define :haproxy2 do |haproxy2|
#    haproxy2.vm.network :forwarded_port, host: 2204, guest: 22, id: "ssh", auto_correct: true
#    haproxy2.vm.network :forwarded_port, host: 8334, guest: 80
    haproxy2.vm.network "private_network", ip: "192.168.1.31"
    haproxy2.vm.hostname = "haproxy2"
    haproxy2.vm.provision "shell", path: "ansiblestrap.sh"
    haproxy2.vm.provision :shell, inline: 'ansible-playbook /vagrant/ansible/ha-ltm.yml -c local -v'
  end
    config.vm.define :mysql1 do |mysql1|
    mysql1.vm.network "private_network", ip: "192.168.1.33"
    mysql1.vm.hostname = "mysql1"
    mysql1.vm.provision "shell", path: "ansiblestrap.sh"
    mysql1.vm.provision :shell, inline: 'ansible-playbook /vagrant/ansible/ha-mysql.yml -c local -v'
  end
    config.vm.define :mysql2 do |mysql2|
    mysql2.vm.network "private_network", ip: "192.168.1.34"
    mysql2.vm.hostname = "mysql2"
    mysql2.vm.provision "shell", path: "ansiblestrap.sh"
    mysql2.vm.provision :shell, inline: 'ansible-playbook /vagrant/ansible/ha-mysql.yml -c local -v'
  end
    config.vm.define :icehouse1 do |icehouse1|
    icehouse1.vm.network "private_network", ip: "192.168.1.35"
    icehouse1.vm.hostname = "icehouse1"
    icehouse1.vm.provision "shell", path: "ansiblestrap.sh"
    icehouse1.vm.provision :shell, inline: 'ansible-playbook /vagrant/ansible/ha-openstack.yml -c local -v'
  end
  config.vm.define :icehouse2 do |icehouse2|
    icehouse2.vm.network "private_network", ip: "192.168.1.36"
    icehouse2.vm.hostname = "icehouse2"
    icehouse2.vm.provision "shell", path: "ansiblestrap.sh"
    icehouse2.vm.provision :shell, inline: 'ansible-playbook /vagrant/ansible/ha-openstack.yml -c local -v'
  end
  config.vm.define :icehousecompute1 do |icehousecompute1|
    icehousecompute1.vm.network "private_network", ip: "192.168.1.45"
    icehousecompute1.vm.hostname = "icehousecompute1"
    icehousecompute1.vm.provision "shell", path: "ansiblestrap.sh"
#    icehousecompute1.vm.provision :shell, inline: 'ansible-playbook /vagrant/ansible/ha-compute.yml -c local -v'
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
