# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "jadesystems/rails-5-2"
  config.vm.box_check_update = true

  config.vm.provider "virtualbox" do |vb|
    vb.linked_clone = true
    vb.memory = "1024"
    vb.cpus = 1
  end
  # Change sudo to existing privilege escalation
  config.vm.provision "shell", inline: <<-SHELL
    export HOME=/home/vagrant

    # Experimentar mudar para become inves de sudo!!!!!
    # echo '############ Installing ansible... ############ '
    # sudo apt-get update
    # sudo apt-get -y install software-properties-common # -y to auto answer question
    # sudo apt-add-repository --yes --update ppa:ansible/ansible
    # sudo apt-get -y install ansible
    
    cd /vagrant
    echo '############ Installing all dependencies coming from Gemfile... ############ '
    bundle install
    
    echo '############ Installing graphviz to draw our diagram ER... ############ '
    ############ Installing graphviz for ER diagrams... ############ '
    sudo apt-get install -yq graphviz libgraphviz-dev graphviz-dev pkg-config
  SHELL

  config.vm.provision "shell", path: "inst_db.sh"
 
  # config.vm.define 'hackatum' do |node|
  #   config.vm.hostname = 'hackatum.local'
  #     config.vm.provision "ansible_local" do |ansible|
  #       ansible.verbose = "v"
  #       # ansible.limit = "all,localhost"
  #       ansible.playbook = "playbook.yml"
  #       # ansible.host_key_checking = false
  #       # ansible.extra_vars = { ansible_ssh_user: 'vagrant' }
  #       # ansible.sudo = true
  #     end
  #   end
  # end
end
