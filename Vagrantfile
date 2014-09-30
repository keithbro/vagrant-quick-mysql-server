# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "trusty"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.hostname = "mysql-dev"
  config.vm.network "forwarded_port", guest: 3306, host: 3306

  config.vm.provision :shell do |shell|
    shell.inline = 'INSTALLED=$(puppet module list | grep puppetlabs-mysql | wc -l)
                    if [ "$INSTALLED" == 0 ]
                    then
                      mkdir -p /etc/puppet/modules;
                      puppet module install puppetlabs/mysql
                    fi'
  end

  config.vm.provision "puppet"
end
