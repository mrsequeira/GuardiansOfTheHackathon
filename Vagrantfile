# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
unless File.file?('config/master.key')
  puts "You are missing the config/master.key!" # Love this feature xD
  exit
end

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.

  config.vm.box = "jadesystems/rails-5-2"
  config.vm.box_check_update = true
  config.vm.box_version = ">=5.0.0"
  config.vm.hostname = "guardians-api"

  config.vm.provider "virtualbox" do |vb|
    vb.linked_clone = true
    vb.memory = "1024"
    vb.cpus = 1
  end

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    cd /vagrant
    bundle install
    rails db:create
    rails db:migrate
    rails db:seed
  SHELL

end
