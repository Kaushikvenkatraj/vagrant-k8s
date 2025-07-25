#! /bin/bash

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