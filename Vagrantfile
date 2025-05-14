Vagrant.configure("2") do |config|
  BOX_IMAGE = "ubuntu/focal64"

  # ram: 1536 
  NODES = {
    "ansible-master" => { ip: "192.168.56.10", ram: 1200 },
    "web"          => { ip: "192.168.56.11", ram: 900 },
  }
  # Obtenir le chemin absolu du dossier Vagrant
  PROJECT_PATH = File.dirname(__FILE__)

  NODES.each do |name, opts|
    config.vm.define name do |node|
      node.vm.box = BOX_IMAGE
      node.vm.hostname = name
      node.vm.network "private_network", ip: opts[:ip]
      node.vm.provider "virtualbox" do |vb|
        vb.memory = opts[:ram]
        vb.cpus = 1
      end

      # Dossier partagé uniquement pour le master
      if name == "ansible-master"
        node.vm.synced_folder PROJECT_PATH, "/home/vagrant/ansible-webstack-boost"
      end

      node.vm.provision "shell", inline: <<-SHELL
        apt-get update
        apt-get install -y python3 python3-apt
      SHELL
    end
  end
end
