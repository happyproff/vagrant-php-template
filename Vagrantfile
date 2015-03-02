name = "vagrant-php-template"

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.network :private_network, type: "dhcp"
  config.vm.hostname = name + ".dev"
  config.vm.provider "virtualbox" do |vb|
    vb.name = name
    vb.memory = 512
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
  end

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = true
  config.hostmanager.include_offline = true

  # https://github.com/smdahlen/vagrant-hostmanager/issues/63
  config.hostmanager.ip_resolver = proc do |machine|
    result = ""
    machine.communicate.execute("ifconfig eth1") do |type, data|
      result << data if type == :stdout
    end
    (ip = /^\s*inet .*?(\d+\.\d+\.\d+\.\d+)\s+/.match(result)) && ip[1]
  end
  
  config.vm.provision :shell, path: "provision/bootstrap.sh"

  # config.vm.synced_folder "../data", "/vagrant_data"

end
