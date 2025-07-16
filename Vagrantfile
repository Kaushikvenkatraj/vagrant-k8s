Vagrant.configure("2") do |config|

 config.vm.box = "ubuntu/focal64"

 config.vm.box_check_update = false

 # Define your master node

 config.vm.define "master" do |master|

  master.vm.hostname = "k8s-master"

  master.vm.network "private_network", ip: "192.168.62.10"

  master.vm.synced_folder "source", "/kubernetes", type: "rsync",
  rsync__exclude: ".git/"

  master.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
        vb.cpus = 2
      end

  master.vm.provision "shell", path: "k8s-install.sh"

 end



 # Define your worker nodes (add more if needed)

 (1..2).each do |i|

  config.vm.define "worker#{i}" do |worker|

   worker.vm.hostname = "k8s-worker#{i}"

   worker.vm.network "private_network", ip: "192.168.62.1#{i}"

   worker.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
      end

   worker.vm.provision "shell", path: "k8s-install.sh"

  end

 end



end