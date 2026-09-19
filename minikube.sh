# This file contains important commands and steps related to the setup of minikube

sudo apt update
sudo apt install -y curl wget apt-transport-https
sudo apt-get inatall -y docker.io
sudo systemctl enable --now docker

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
ls
chmod +x minikube
sudo mv minikube /usr/local/bin
minikube -version

curl -Lo kubectl "https://k8s.io(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin
minikube start --driver=docker --vm=true

kubectl get nodes
kubectl get nodes --context kind-pn-cluster

minikube stop .
minikube delete .

kubectl config use-context kind-pn-cluster
kubectl get nodes

