# some pod commands
kubectl apply -f pod.yml
kubectl exec -it pod/nginx-pod . -n nginx --bash
kubectl describe pod/nginx-pod -n nginx # it will give every status 
kubectl scale deployment/nginx-deployment -n nginx --replicas=5 # scale the replica to 5 from 2 having the deployment named nginx-deployment
kubectl get-all -n nginx

# to create replicaset and view them
kubectl apply -f replicasets.yml
kubectl get replicasets -n nginx

# some commands related to cronjob 
kubectl apply -f cronjob.yml
kubectl get cronjob -n nginx
kubectl get pods -n nginx
kubectl logs pod -n nginx
kubectl delete -f cronjob.yml

# some commands related with persistent volumes and persistent volume claims
kubectl get pv
kubectl get pvc

# port forwarding and scaling
kubectl port-forward service/nginx-service -n nginx 80:80 --address=0.0.0.0
kubectl scale deployment apache-deployment -n apache --replicas=3

# some commands related to statefulsets
kubectl exec -it mysql-statefulset -o -n mysql --bash

# some commands related to taints and toleration
kubectl taint nodes <node> key=value:effect  # exaample- kubectl taint nodes node1 environment=production:NoSchedule
kubectl taint nodes node1 environment=production:NoSchedule-   # command to removing a taint (-) means removing.

# toleration example
spec:
  tolerations:
    - key: "gpu"
      operator: "Equal"
      value: "true"
      effect: "NoSchedule"

# some commands related to hpa,vpa,keda
kubectl top node # it will show metrics