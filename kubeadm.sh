# This file contains important commands and steps related to the setup of kubeadm

# on both master and worker node
step1 -> disable swap

step2 -> load necessary kernel module required for kubernetes networking

cat << EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

step3 -> set systemctl parameters

cat << EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge_nf_call_iptables=1
net.bridge.bridge_nf_call_ip6tables=1
net.ipv4.ip_forward=1
EOF

sudo sysctl --system
lsmod | grep br_netfilter
lsmod | grep overlay

step4 -> install containerd
step5 -> install kubernetes component(kubectl,kubeadm)

# Below steps to be performed only on the master node.

step1 -> sudo kubeadm init
step2 -> setup local kubeconfig

    mkdir -p "$HOME"/.kube
    sudo cp -i /etc/kubernetes/admin.conf "$HOME"/.kube/config
    sudo chown "$(id -u)":"$(id -g)" "$HOME"/.kube/config

step3 -> install network plugin(CNI,calico)

kubectl apply -f (calico address)

step4 -> generate join command -> to join worker to master

kubeadm token create --print-join-command

# Below steps to be performed only on all worker node

sudo kubeadm reset pre-flight checks

watch kubectl get nodes
kubectl run nginx --image=nginx:latest