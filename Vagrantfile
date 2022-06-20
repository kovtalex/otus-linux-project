# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.box_url = 'https://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7-x86_64-Vagrant-2004_01.VirtualBox.box'
  config.vm.box_download_checksum = '7e83943defcb5c4e9bebbe4184cce4585c82805a15e936b01b1e893b63dee2c5'
  config.vm.box_download_checksum_type = 'sha256'
  config.vm.box_check_update = false  

  config.vm.provision "ansible" do |ansible|
#    ansible.verbose = "vvv"
    ansible.playbook = "playbook.yml"
    ansible.become = true
    ansible.limit = "all"
    ansible.vault_password_file = "./.ansible_vault_pass"
    ansible.raw_arguments = Shellwords.shellsplit(ENV['ANSIBLE_ARGS']) if ENV['ANSIBLE_ARGS']
  end

  config.vm.provider "virtualbox" do |v|
	  v.memory = 512
    v.customize ["modifyvm", :id, '--audio', 'none']    
  end 

  config.vm.define "fw" do |fw|
    fw.vm.network "private_network", ip: "192.168.50.10", virtualbox__intnet: "private_network"
    fw.vm.network "public_network", bridge: "en0: Wi-Fi", ip: "192.168.0.200"       
    fw.vm.hostname = "fw"  
  end

  config.vm.define "app" do |app|
    app.vm.network "private_network", ip: "192.168.50.11", virtualbox__intnet: "private_network"
    app.vm.hostname = "app"
  end

  config.vm.define "database" do |database|
    database.vm.network "private_network", ip: "192.168.50.12", virtualbox__intnet: "private_network"
    database.vm.hostname = "database"
  end

  config.vm.define "replica" do |replica|
    replica.vm.network "private_network", ip: "192.168.50.13", virtualbox__intnet: "private_network"
    replica.vm.hostname = "replica"
  end  

  config.vm.define "backup" do |backup|
    backup.vm.network "private_network", ip: "192.168.50.14", virtualbox__intnet: "private_network"
    backup.vm.hostname = "backup"
  end

  config.vm.define "logging" do |logging|
    logging.vm.network "private_network", ip: "192.168.50.15", virtualbox__intnet: "private_network"
    logging.vm.hostname = "logging"
  end

  config.vm.define "monitoring" do |monitoring|
    monitoring.vm.network "private_network", ip: "192.168.50.16", virtualbox__intnet: "private_network"
    monitoring.vm.hostname = "monitoring"
    monitoring.vm.network "forwarded_port", guest: 3000, host: 3000
    monitoring.vm.network "forwarded_port", guest: 9090, host: 9090
    monitoring.vm.network "forwarded_port", guest: 9093, host: 9093    
  end
end
