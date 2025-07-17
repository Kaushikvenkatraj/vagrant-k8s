# 🐳 Kubernetes Cluster with Vagrant and VirtualBox

This project sets up a **multi-node Kubernetes cluster** using Vagrant, VirtualBox, and Ubuntu 20.04. It provisions one master node and two worker nodes automatically using a shell script.

---

## ✅ Prerequisites

- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

---

## 📦 What's Included

- ✅ Vagrant setup with one master and two worker nodes
- ✅ Automated installation of Docker, kubelet, kubeadm, and kubectl
- ✅ Custom network for internal communication
- ✅ Configured for Kubernetes v1.33 (via official packages)

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash

git clone https://github.com/Kaushikvenkatraj/vagrant-k8s.git
cd vagrant-k8s

```
### 2. Run the vagrant up command

```bash

vagrant up

# This will spin up one master node and two worker nodes using Ubuntu 20.04, then install Docker and Kubernetes tools automatically via k8s-install.sh. It will take some time roughlt 20-25 minutes.

```

### 3. Intialize the Kubernetes Master

```bash

vagrant ssh master

sudo kubeadm init --pod-network-cidr=192.168.0.0/16

# Enables kubectl for your user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

```

### 4. Join the worker nodes

```bash

vagrant ssh worker1
sudo <paste-the-kubeadm-join-command-here>
exit

vagrant ssh worker2
sudo <paste-the-kubeadm-join-command-here>
exit

```

### 5. Verfiy the cluster

```bash

vagrant ssh master

kubectl get nodes

```

## Project structure

```bash
.
├── Vagrantfile             # Master and 2 worker node definitions
├── k8s-install.sh          # Installs Docker & Kubernetes components
├── source/
│   └── nginx.yaml          # Placeholder for your Kubernetes YAMLs
└── README.md   
```

## Clean up after testing

```bash

vagrant destroy -f

```