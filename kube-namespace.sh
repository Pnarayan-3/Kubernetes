# This files gives the important instruction regarding the kubernetes namespace

kubectl create ns nginx
kubectl run nginx image=nginx
kubectl get pods  # gives running pods

kubectl get pods -n nginx
kubectl delete pod nginx # to delete the pod

kubectl run nginx -n nginx # to create this pod inside nginx namespace
kubectl get pods # it will give resources in default namespace
kubectl delete pod nginx -n nginx # to delete the pod inside nginx namespace
kubectl delete ns nginx # to delete the namespace nginx
kubectl apply -f namespace.yml # this used to create or update namespaces
kubectl get ns # to display all namespce created or default

# some pod commands
kubectl apply -f pod.yml
kubectl exec -it pod/nginx-pod . -n nginx --bash
kubectl ddescribe pod/nginx-pod -n nginx # it will give every status 
kubectl scale deployment/nginx-deployment -n nginx --replicas=5 # scale the replica to 5 from 2 having the deployment named nginx-deployment