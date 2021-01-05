# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "8192"
    vb.cpus = 2
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.install = true
    ansible.playbook = "provisioning/ubuntu_base.yml"
    ansible.extra_vars = { ansible_python_interpreter:"/usr/bin/python3" }
  end

  config.vm.provision :reload

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "provisioning/elastic.yml"
    ansible.extra_vars = { ansible_python_interpreter:"/usr/bin/python3" }
  end

  config.vm.provision "shell", inline: <<-SHELL
    wget -qO ~vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/hashicorp/vagrant/master/keys/vagrant.pub
    chown vagrant ~vagrant/.ssh/authorized_keys
    chmod 0600 ~vagrant/.ssh/authorized_keys

    apt autoremove -y
    apt clean -y
    apt autoclean -y
    
    dd if=/dev/zero of=/EMPTY bs=1M
    rm -f /EMPTY

    poweroff
  SHELL
  config.vm.network "forwarded_port", guest: 5601, host: 25601, host_ip: "127.0.1.10"
  config.vm.network "forwarded_port", guest: 9200, host: 29200, host_ip: "127.0.1.10"
end
