Vagrant.configure("2") do |config|

 config.vm.box = "ubuntu/bionic64"

 # Define your master node

 config.vm.define "master" do |master|

  master.vm.hostname = "k8s-master"

  master.vm.network "private_network", ip: "192.168.62.10"

  master.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
        vb.cpus = 2
      end


   master.vm.provision "shell", inline: <<-SHELL

   sudo swapoff -a

   sudo apt-get update

   sudo apt-get install -y docker.io

   sudo systemctl start docker

   sudo systemctl enable docker

   # Install kubeadm, kubelet, and kubectl

   sudo apt-get install -y apt-transport-https ca-certificates curl gpg

   sudo mkdir -p -m 755 /etc/apt/keyrings

   curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.33/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

   echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.33/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

   sudo apt-get update

   sudo apt-get install -y kubelet kubeadm kubectl

   sudo apt-mark hold kubelet kubeadm kubectl

   sudo systemctl enable --now kubelet

  SHELL

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

   worker.vm.provision "shell", inline: <<-SHELL

   sudo swapoff -a

   sudo apt-get update

   sudo apt-get install -y docker.io

   sudo systemctl start docker

   sudo systemctl enable docker

   # Install kubeadm, kubelet, and kubectl

   sudo apt-get install -y apt-transport-https ca-certificates curl gpg

   sudo mkdir -p -m 755 /etc/apt/keyrings

   curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.33/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

   echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.33/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

   sudo apt-get update

   sudo apt-get install -y kubelet kubeadm kubectl

   sudo apt-mark hold kubelet kubeadm kubectl

   sudo systemctl enable --now kubelet


   SHELL

  end

 end



end